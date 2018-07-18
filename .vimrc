filetype plugin indent on

filetype indent on      " load filetype-specific indent files
syntax enable           " enable syntax processing

let g:GetFileIgnoreList = ['*.o', '*.pyc', '*/tmp/*', '*~', '*/.git/*', '*/.tox/*', '*/build/*', '*/.testr/*', '*#']

"move across viewports w/ Tab
nmap <silent> <Tab> <C-w><C-w>

"close non active viewports on qq
nmap <silent> <unique> qq <C-w>o

"open a file in hsplit on F3 (navigate files up/down with C-p/space)
nmap <silent> <F3> :sp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>
imap <silent> <F3> <Esc>:sp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>

"open a file in vsplit viewport on double F3
nmap <silent> <unique> <F3><F3> :vsp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>
imap <silent> <unique> <F3><F3> <Esc>:vsp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>

"off/on indentation modes on F4/double F4
nmap <silent> <F4> :setlocal noautoindent<CR>:setlocal nocindent<CR>:setlocal nosmartindent<CR>:setlocal indentexpr=<CR>
imap <silent> <F4> <Esc>:setlocal noautoindent<CR>:setlocal nocindent<CR>:setlocal nosmartindent<CR>:setlocal indentexpr=<CR>
nmap <silent> <F4><F4> :setlocal autoindent<CR>:setlocal cindent<CR>:setlocal indentexpr=GetPythonIndent(v:lnum)<CR>
imap <silent> <F4><F4> <Esc>:setlocal autoindent<CR>:setlocal cindent<CR>:setlocal indentexpr=GetPythonIndent(v:lnum)<CR>

nmap <silent> <C-P> :setlocal paste<CR>
nmap <silent> <C-P><C-P> :setlocal nopaste<CR>
nmap <silent> <C-N> :setlocal number<CR>
nmap <silent> <C-N><C-N> :setlocal nonumber<CR>
nmap <silent> <C-X> :Tab /=<CR>
nmap <silent> <C-C> :Tab /=><CR>
imap <silent> <C-P> <Esc>:setlocal paste<CR>
imap <silent> <C-P><C-P> <Esc>:setlocal nopaste<CR>
imap <silent> <C-N> <Esc>:setlocal number<CR>
imap <silent> <<C-N><C-N> <Esc>:setlocal nonumber<CR>
imap <silent> <C-X> <Esc>:Tab /=<CR>
imap <silent> <C-C> <Esc>:Tab /=><CR>

" turn off search highlight on double space
nnoremap <space><space> :nohlsearch<CR>

" save on F2
imap <F2> <Esc>:w<CR>
nmap <F2> :w<CR>
" save and exit on double F2
imap <F2><F2> <Esc>:wq<CR>
nmap <F2><F2> :wq<CR>
" Exit/force on double Esc or tripple Esc
nmap <Esc><Esc> :q<CR>
nmap <Esc><Esc><Esc> :q!<CR>

set expandtab           " tabs are spaces
set shiftwidth=2
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set autoindent
set cindent
"set smarttab

set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set textwidth=79

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.rst setlocal textwidth=80
au BufRead,BufNewFile COMMIT_EDITMSG setlocal textwidth=71

" vim plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'getfile'
Plug 'tpope/vim-unimpaired'
Plug 'touv/vim-arrow'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" manually fix that func to hack getfile.vim's hotkeys:
"function! s:DoGetFile()
    "imap <buffer> <silent> <space> <Down>
