filetype plugin on
filetype indent on      " load filetype-specific indent files
syntax enable           " enable syntax processing

let g:GetFileIgnoreList = ['*.o', '*.pyc', '*/tmp/*', '*~', '*/.git/*', '*/.tox/*', '*/build/*', '*/.testr/*', '*#']
set includeexpr=substitute(v:fname,'\|.*','','g')

" move across viewports on Tab (q,Tab for tabs)
nnoremap <silent> <Tab> <C-w><C-w>
nmap <silent> <unique> q<Tab> gT
" z to toggle zoom of a viewport in/out
nnoremap <silent> <unique> z :call ToggleZoom(v:true)<CR>
" close non active (all but this one) viewports on qq
nmap <silent> <unique> qq <C-w>o
" q to open a file under cursor in a new viewport
nmap <silent> <unique> q V<c-w>f
" Backspace to go back to previous file (swaps two files in a loop)
nmap <silent> <unique> <BS> :e#<CR>

" browse/search a file in ./git/history repo on F3/double/triplle F3
"   - C-t / C-x / C-v to open a picked file in a tab/split/vsplit viewport
nmap <silent> <unique> <F3> :Files! <CR>
imap <silent> <unique> <F3> <Esc>:Files! <CR>
nmap <silent> <unique> <F3><F3> :GFiles! <CR>
imap <silent> <unique> <F3><F3> <Esc>:GFiles! <CR>
nmap <silent> <unique> <F3><F3><F3> :History <CR>
imap <silent> <unique> <F3><F3><F3> <Esc>:History <CR>

" toggle indentation modes on F4/double F4
nmap <silent> <unique> <F4> :setlocal noautoindent<CR>:setlocal nocindent<CR>:setlocal nosmartindent<CR>:setlocal indentexpr=<CR>
imap <silent> <unique> <F4> <Esc>:setlocal noautoindent<CR>:setlocal nocindent<CR>:setlocal nosmartindent<CR>:setlocal indentexpr=<CR>
nmap <silent> <unique> <F4><F4> :setlocal autoindent<CR>:setlocal cindent<CR>:setlocal indentexpr=GetPythonIndent(v:lnum)<CR>
imap <silent> <unique> <F4><F4> <Esc>:setlocal autoindent<CR>:setlocal cindent<CR>:setlocal indentexpr=GetPythonIndent(v:lnum)<CR>

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
imap <silent> <C-N><C-N> <Esc>:setlocal nonumber<CR>

" align 'x = y' assignments on C-x (Ruby/Puppet'ish, '=>' is auto)
nmap <silent> <C-X> :Tab /=<CR>
imap <silent> <C-X> <Esc>:Tab /=<CR>

" turn off search highlight on double space
nnoremap <space><space> :nohlsearch<CR>

" show goguru callees/what implements a func/method on F1/double F1
"   - show go doc on tripple F1
nmap <silent> <unique> <F1><F1><F1> :GoDoc <CR>
nmap <silent> <unique> <F1><F1> :GoImplements <CR>
nmap <silent> <unique> <F1> :GoCallees <CR>
imap <silent> <unique> <F1><F1><F1> <Esc>:GoDoc <CR>
imap <silent> <unique> <F1><F1> <Esc>:GoImplements <CR>
imap <silent> <unique> <F1> <Esc>:GoCallees <CR>
"   - go straight to the definition on F5
nmap <silent> <unique> <F5> :GoDef <CR>
imap <silent> <unique> <F5> <Esc>:GoDef <CR>
" show goguru all global references for a func/method on F8 (is slow!)
nmap <silent> <unique> <F8> :GoReferrers <CR>
imap <silent> <unique> <F8> <Esc>:GoReferrers <CR>

" save on F2, save & exit on double F2
imap <silent> <F2> <Esc>:w<CR>
nmap <silent> <F2> :w<CR>
imap <silent> <F2><F2> <Esc>:wq<CR>
nmap <silent> <F2><F2> :wq<CR>
autocmd FileType go imap <buffer> <silent> <F2><F2> <Esc>:GoImports <CR> <bar> <Esc>:wq<CR>
autocmd FileType go nmap <buffer> <silent> <F2><F2> :GoImports <CR> <bar> :wq<CR>
autocmd FileType go imap <buffer> <silent> <F2> <Esc>:GoImports <CR> <bar> <Esc>:w<CR>
autocmd FileType go nmap <buffer> <silent> <F2> :GoImports <CR> <bar> :w<CR>

" run tox PEP8/Go-lint on F7
nmap <silent> <F7> :!tox -epep8 <CR>
imap <silent> <F7> <Esc>:!tox -epep8 <CR>
autocmd FileType go nmap <buffer> <silent> <F7> :GoMetaLinter <CR>
autocmd FileType go imap <buffer> <silent> <F7> <Esc>:GoMetaLinter <CR>

" run tox -epy36 / go test on double F7
nmap <silent> <F7><F7> :!rm -r .testrepository; tox -epy36<CR>
imap <silent> <F7><F7> <Esc>:!rm -r .testrepository; tox -epy36<CR>
" run go test single func on g,t
autocmd FileType go nmap <buffer> <silent> <F7><F7> :GoTestFunc <CR>
autocmd FileType go imap <buffer> <silent> <F7><F7> <Esc>:GoTestFunc <CR>

" compile LaTeX on F9
autocmd FileType tex nmap <buffer> <silent> <F9> :!docker run --rm -it -v $(pwd):/home danteev/texlive texliveonfly -c latexmk -a "-pdf -f -synctex=0" %<CR>

" exit/force on double Esc or tripple Esc
nmap <Esc><Esc> :q<CR>
nmap <Esc><Esc><Esc> :q!<CR>

" show git diff to HEAD on h and to HEAD~ for h,h 
nmap <silent> <unique> h :!git difftool @ %<CR>
nmap <silent> <unique> hh :!git difftool @~ %<CR>
" show full git diff to HEAD/HEAD~ on h,g/h,h,g 
nmap <silent> <unique> hg :!git difftool @<CR>
nmap <silent> <unique> hhg :!git difftool @~<CR>

" use autocomplete on smart Tab / C-r
inoremap <silent> <Tab> <c-r>=Smart_TabComplete()<CR>

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

augroup at_end_of_vim_setup
    let &winheight = &lines * 5 / 10 + 1
    let &winminheight = 5
    vert resize | resize
augroup END

augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END

"vim plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go' "requires at least Vim 8.0.1453
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-unimpaired'
Plug 'touv/vim-arrow'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pythoncomplete'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType go set omnifunc=go#complete#Complete

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

function! ToggleZoom(toggle)
  if exists("t:restore_zoom") && (t:restore_zoom.win != winnr() || a:toggle == v:true)
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:toggle
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      vert resize | resize
  endi
endfunction
