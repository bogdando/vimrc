filetype plugin indent on

filetype indent on      " load filetype-specific indent files
syntax enable           " enable syntax processing

let g:GetFileIgnoreList = ['*.o', '*.pyc', '*/tmp/*', '*~', '*/.git/*', '*/.tox/*', '*/build/*', '*/.testr/*', '*#']

" move across viewports w/ Tab
nmap <silent> <Tab> <C-w><C-w>

" close non active viewports on qq
nmap <silent> <unique> qq <C-w>o

" open a file in hsplit on F3 (navigate files up/down with C-p/space)
nmap <silent> <F3> :sp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>
imap <silent> <F3> <Esc>:sp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>

" open a file in vsplit viewport on double F3
nmap <silent> <unique> <F3><F3> :vsp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>
imap <silent> <unique> <F3><F3> <Esc>:vsp<CR>:GetFileClearCache<CR>:GetFileCacheFiles .<CR>:GetFile<CR>

" toggle indentation modes on F4/double F4
nmap <silent> <F4> :setlocal noautoindent<CR>:setlocal nocindent<CR>:setlocal nosmartindent<CR>:setlocal indentexpr=<CR>
imap <silent> <F4> <Esc>:setlocal noautoindent<CR>:setlocal nocindent<CR>:setlocal nosmartindent<CR>:setlocal indentexpr=<CR>
nmap <silent> <F4><F4> :setlocal autoindent<CR>:setlocal cindent<CR>:setlocal indentexpr=GetPythonIndent(v:lnum)<CR>
imap <silent> <F4><F4> <Esc>:setlocal autoindent<CR>:setlocal cindent<CR>:setlocal indentexpr=GetPythonIndent(v:lnum)<CR>

" swap words forward/back on ww/w (todo support dots/slashes maybe)
nmap <silent> ww "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nmap <silent> w "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>

" toggle paste mode/show line numbers on C-a/n and double press
nmap <silent> <C-A> :setlocal paste<CR>
nmap <silent> <C-A><C-A> :setlocal nopaste<CR>
nmap <silent> <C-N> :setlocal number<CR>
nmap <silent> <C-N><C-N> :setlocal nonumber<CR>
imap <silent> <C-A> <Esc>:setlocal paste<CR>
imap <silent> <C-A><C-A> <Esc>:setlocal nopaste<CR>
imap <silent> <C-N> <Esc>:setlocal number<CR>
imap <silent> <<C-N><C-N> <Esc>:setlocal nonumber<CR>

" align paragraph on =/=> by C-x/C-c (Ruby/Puppet'ish)
nmap <silent> <C-X> :Tab /=<CR>
nmap <silent> <C-C> :Tab /=><CR>
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

" run tox PEP8/Go-lint on F7
nmap <F7> :!tox -epep8 <CR> <bar> :GoMetaLinter <CR>

" compile LaTeX on F9
nmap <F9> :!docker run --rm -it -v $(pwd):/home danteev/texlive texliveonfly -c latexmk -a "-pdf -f -synctex=0" %<CR>

" exit/force on double Esc or tripple Esc
nmap <Esc><Esc> :q<CR>
nmap <Esc><Esc><Esc> :q!<CR>

" run tox -epy27/35 on t/tt
nmap <silent> <unique> t :!rm -r .testrepository; tox -epy27<CR>
nmap <silent> <unique> tt :!rm -r .testrepository; tox -epy36<CR>

" show git diff to HEAD on h and to HEAD~ for hh 
nmap <silent> <unique> h :!git difftool @ %<CR>
nmap <silent> <unique> hh :!git difftool @~ %<CR>
" show full git diff to HEAD/HEAD~ on hg/hhg 
nmap <silent> <unique> hg :!git difftool @<CR>
nmap <silent> <unique> hhg :!git difftool @~<CR>

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

"allows cursor change in tmux mode
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

"vim plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'getfile'
Plug 'tpope/vim-unimpaired'
Plug 'touv/vim-arrow'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pythoncomplete'
call plug#end()

autocmd FileType python set omnifunc=python3complete#Complete

" use autocomplete on smart Tab
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <silent> <tab> <c-r>=Smart_TabComplete()<CR>

"manually fix that func to hack getfile.vim's hotkeys:
"function! s:DoGetFile()
    "imap <buffer> <silent> <space> <Down>
