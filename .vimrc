set number
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set mouse=a
set autochdir

" invisible chars
set list
set listchars=tab:\|\ ,eol:¬,space:⸱,trail:·
hi SpecialKey ctermfg=grey

" https://stackoverflow.com/questions/2574027/automatically-go-to-next-line-in-vim
set whichwrap+=<,>,[,],h,l
set backspace=indent,eol,start

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" https://stackoverflow.com/a/34992101
" autoclosing of parens brackets and the like
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == """ ? "\<Right>" : "\""
"inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "\'"
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
" press ctr c to copy to clipboard
vnoremap <C-c> :w !xsel -i -b<CR><CR>

"https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
" highlight matches
set hlsearch

"https://stackoverflow.com/questions/486027/close-a-split-window-in-vim-without-resizing-other-windows
"no window resizing when splitting/closing
set noea

source ~/layout.vim

set incsearch
