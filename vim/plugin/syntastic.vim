let g:syntastic_ruby_checkers = ['rubocop']

" Always add any detected errors into the location list
let g:syntastic_always_populate_loc_list = 1

" Show warnings as well as errors
let g:syntastic_quiet_warnings = 0

" Don't auto-open it when errors/warnings are detected, but auto-close when no
" more errors/warnings are detected.
let g:syntastic_auto_loc_list = 2

" Highlight syntax errors where possible
let g:syntastic_enable_highlighting = 1

" Show this many errors/warnings at a time in the location list
let g:syntastic_loc_list_height = 5

" Only run checkers on save, not save & quit
let g:syntastic_check_on_wq = 0

" Only use syntastic when I tell it to
let g:syntastic_mode_map = {'mode': 'passive'}
