syntax on

set cursorline     " Highlight currently focused line
set cursorcolumn
let &colorcolumn="80,".join(range(100,999),",")
set number         " Show line numbers
set laststatus=2   " Always show status line

set wildmenu       " Tab-completion menu for command mode
set wildignore+=*.o,*.pyc,*/tmp/*,*.swp,*.zip
set wildmode=list:longest,full

" Vertically center cursor in middle of buffer
set scrolloff=999

" Allow interaction using mouse
set mouse=a

"Characters to display when showing invisible characters
set listchars=eol:¶,tab:⇥\ ,trail:·

" Ensure 256 colours
set t_Co=256

" Clear screen when leaving vim
autocmd VimLeave * !clear
