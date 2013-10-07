#!/usr/bin/env ruby

require 'optparse'
require 'fileutils'

EXCLUDED = [
  'bootstrap.rb',
  'sshconfig',
  'README.md'
]
DOT_DIR    = File.expand_path(File.dirname(__FILE__))
DOTFILES   = Dir.entries(DOT_DIR).reject{|f| f.start_with? '.'} - EXCLUDED
HOME       = ENV['HOME']
BACKUP_DIR = File.join(HOME, '.backup')
OPTIONS    = {}

OptionParser.new do |opts|
  opts.on('-b', '--backup', 'Backup your current dotfiles(Will delete your current ~/.backup dir)') do
    OPTIONS[:backup] = true
  end

  opts.on('-v', '--verbose', 'Verbose') do
    OPTIONS[:verbose] = true
  end

  opts.on('-s', '--setup', 'Setup system with the most up to date of software (git/tmux)') do
    OPTIONS[:setup] = true
  end

  opts.on('-h', '--help', 'Show this help message') do
    puts opts
    exit
  end
end.parse!

def debug(message)
  puts message if OPTIONS[:verbose]
end

def submodule_update
  debug "Initializing and updating submodules"
  Dir.chdir(DOT_DIR)
  system('git submodule update --init --recursive')
  debug "Done"
end

def update_vim
  debug "Initializing and updating vim bundles"
  system('vim +BundleInstall +qall')
  debug "Done"
end

def make_backup_dir
  return unless OPTIONS[:backup]
  FileUtils.rm_rf(BACKUP_DIR, secure: true)
  FileUtils.mkdir_p BACKUP_DIR
end

def backup(old, backup = old)
  return unless OPTIONS[:backup]
  old_path    = File.join(HOME, old)
  backup_path = File.join(BACKUP_DIR, backup)
  return unless File.exists? old_path
  debug "Backing up #{old_path} to #{backup_path}"
  FileUtils.cp_r(old_path, backup_path)
end

def symlink(old, new, backup = true)
  old_path = File.join(DOT_DIR, old)
  new_path = File.join(HOME, new)
  if File.exists?(new_path)
    debug "Removing #{new_path}"
    FileUtils.rm_rf new_path, secure: true
  end
  debug "Symlinking #{old_path} to #{new_path}"
  FileUtils.ln_sf( old_path, new_path)
end

def symlink_dotfile(filename)
  backup('.' + filename)
  symlink(filename, '.' + filename)
end

def symlink_ssh
  FileUtils.mkdir_p File.join(HOME, '.ssh')
  backup('.ssh/config', '.sshconfig')
  symlink('sshconfig', '.ssh/config')
end

def symlink_dotfiles
  DOTFILES.each do |file|
    symlink_dotfile(file)
  end
  symlink_ssh
end

# TODO: Get something like chef/ansible to set this stuff up.
def setup_system
  system('sudo apt-get -y install software-properties-common')
  system('sudo add-apt-repository -y ppa:pi-rho/dev')
  system('sudo add-apt-repository -y ppa:git-core/ppa')
  system('sudo apt-get -y update')
  system('sudo apt-get -y install tmux git')
end

if OPTIONS[:setup]
  setup_system
else
  make_backup_dir
  submodule_update
  symlink_dotfiles
  update_vim
end
