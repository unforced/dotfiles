call pathogen#infect()

filetype plugin on
filetype plugin indent on   " Is this necessary?

set autoindent
set background=dark
set backspace=2
set colorcolumn=80
set cursorcolumn
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-
set nocompatible
set number
set scrolloff=3
set softtabstop=2
set shiftwidth=2
set showtabline=2
set sidescrolloff=3
set sw=2
set term=xterm-256color
set ts=2
set wildmenu
set wildmode=longest,list,full
syntax on
colorscheme grb256

highlight ColorColumn ctermbg=234

" Highlight extraneous whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!

command Kws mark w | %s/\s\+$// | 'w

nnoremap <silent> <F9> :w<CR>:SyntasticCheck<CR>

" Spellcheck, but not very visibly.
set spell
highlight SpellBad ctermbg=234
highlight SpellCap ctermbg=234

" Improve fold colors
highlight Folded ctermbg=234

" Navigate tabs with the tab key. It seems to make sense
" and <Tab> isn't used for anything else.
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevious<CR>

" The ultimate status line.
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

if has('persistent_undo')
  set undodir=~/.vim/tmp/undo,. " keep undo files out of the way
  set undofile " actually use undo files
endif

" For Ctrl+P
let g:ctrlp_map = '<C-p>'
nmap <C-t> :tabe<CR>
nmap <C-w> :q<CR>


" For tabbing selection
vmap <tab> >gv
vmap <S-tab> <gv

nmap <Leader>p :set paste!<CR>
nmap <Leader>l :setlocal number!<CR>
nmap <Leader>e :NERDTreeToggle<CR>

let g:syntastic_mode_map = {'mode': 'passive'}

let g:ycm_filetype_whitelist = {}

" Removes highlight with return after a search
nnoremap <CR> :noh<CR>:<backspace>

" Custom settings by files
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setlocal noexpandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.hamljs setlocal filetype=haml

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
