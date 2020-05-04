filetype plugin on
filetype indent on      " load filetype-specific indent files
syntax enable           " enable syntax processing

let g:GetFileIgnoreList = ['*.o', '*.pyc', '*/tmp/*', '*~', '*/.git/*', '*/.tox/*', '*/build/*', '*/.testr/*', '*#']
set includeexpr=substitute(v:fname,'\|.*','','g')
set foldmethod=syntax   " folding blocks of code
set mmp=5000            " https://github.com/vim/vim/issues/2049
set splitbelow          " open new split panes to right and bottom (more natural)
set splitright

"vim-go visual effects
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1 

"highlight cursor visual effects
let g:brightest#enable_filetypes = {
\ "go" : 1,
\ "py" : 1,
\ "pp" : 1,
\ "yaml" : 1,
\ "sh" : 1
\}
let g:brightest#highlight = {
\   "group" : "BrightestUnderline",
\}
let g:brightest#highlight_in_cursorline = {
\   "group" : "BrightestReverse",
\}
"let g:brightest#enable_insert_mode = 1
"let g:brightest#enable_highlight_all_window = 1

" vim w/o args: starts from MRU window to pick files
" vim foo: starts from MRU windows to pick files by foo filter
" <TAB> move across viewports (<C-PgUp/PgDn> for tabs)
nnoremap <silent> <Tab> <C-w><C-w>
" (N)<SPACE> toggle folding levels between 0/N (defaults 0/1)
"   F.e: 3<SPACE> - sets folding level to 3
nnoremap <silent> <space> :<C-U>call ToggleFoldLevels(v:count)<CR>
" <o> fold/unfold toggle
nmap <silent> <unique> o za<CR>
" <f> / <a,f> move to the next/prev closed fold block
nnoremap <silent> <unique> f :call NextClosedFold('j')<CR>
nnoremap <silent> <unique> af :call NextClosedFold('k')<CR>

" <x> toggle zoom of a viewport in/out
nnoremap <silent> <unique> x :call ToggleZoom(v:true)<CR>
" <qq> close non active (all but this one) viewports
nmap <silent> <unique> qq <C-w>o
" <Backspace> go back to previous file (swaps two files in a loop)
nmap <silent> <unique> <BS> :e#<CR>

" <F3> x1/x2/x3 browse a file in ./tree/history (single/double/tripple press)
" <C-t> / <C-x> / <C-v> open a picked file in a tab/split/vsplit viewport
nmap <silent> <unique> <F3> :Files! <CR>
imap <silent> <unique> <F3> <Esc>:Files! <CR>
nmap <silent> <unique> <F3><F3> :NERDTreeToggle <CR>
imap <silent> <unique> <F3><F3> <Esc>:NERDTreeToggle <CR>
nmap <silent> <unique> <F3><F3><F3> :History <CR>
imap <silent> <unique> <F3><F3><F3> <Esc>:History <CR>
" <a,F3> open alternative view for history ( <o> to open file in a viewport)
nmap <silent> <unique> a<F3> :MRU <CR>

" <ww> / <w> swap words forward/back 
nmap <silent> ww "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nmap <silent> w "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>

" <C-a(,a)> toggle ON/OFF paste mode
" <C-n(,n)> toggle line numbers
nmap <silent> <C-A> :setlocal paste<CR>
nmap <silent> <C-A>a :setlocal nopaste<CR>
nmap <silent> <C-N> :setlocal number<CR>
nmap <silent> <C-N>n :setlocal nonumber<CR>
imap <silent> <C-A> <Esc>:setlocal paste<CR>
imap <silent> <C-A>a <Esc>:setlocal nopaste<CR>
imap <silent> <C-N> <Esc>:setlocal number<CR>
imap <silent> <C-N>n <Esc>:setlocal nonumber<CR>

" <C-x> align 'x = y' assignments (Ruby/Puppet'ish, '=>' is auto)
nmap <silent> <C-X> :Tab /=<CR>
imap <silent> <C-X> <Esc>:Tab /=<CR>

" <SPACE> x2 turn off search highlight
nnoremap <space><space> :nohlsearch<CR>

" <F5> x1/x2 show goguru callees or what implements a func/method (slow&faily!)
autocmd FileType go nmap <silent> <F5><F5> :GoImplements <CR>
autocmd FileType go nmap <silent> <F5> :GoCallees <CR>
autocmd FileType go imap <silent> <F5><F5> <Esc>:GoImplements <CR>
autocmd FileType go imap <silent> <F5> <Esc>:GoCallees <CR>
" <F1> go straight to the definition (go back on backspace)
autocmd FileType go nmap <silent> <F1> :GoDef <CR>
autocmd FileType go imap <silent> <F1> <Esc>:GoDef <CR>
" <a,F1> show goguru global referers for an entity
autocmd FileType go nmap <silent> a<F1> :GoReferrers <CR>
" <F8> show go doc
autocmd FileType go nmap <silent> <F8> :GoDoc <CR>
autocmd FileType go imap <silent> <F8> <Esc>:GoDoc <CR>

" <F6> toggle tags bar view
"for python install ftplugin/python.vim manually
autocmd FileType go let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
nmap <silent> <F6> :TagbarToggle<CR>
imap <silent> <F6> <Esc>:TagbarToggle<CR>

" <F2> save, save & exit (and run goimports) on double press
imap <silent> <F2> <Esc>:w<CR>
nmap <silent> <F2> :w<CR>
imap <silent> <F2><F2> <Esc>:wq<CR>
nmap <silent> <F2><F2> :wq<CR>
autocmd FileType go imap <buffer> <silent> <F2><F2> <Esc>:GoImports <CR> <bar> :execute ":!goimports -w -v " . bufname('%')<CR> <bar> :wq<CR>
autocmd FileType go nmap <buffer> <silent> <F2><F2> :GoImports <CR> <bar> :execute ":!goimports -w -v " . bufname('%')<CR> <bar> :wq<CR>
autocmd FileType go imap <buffer> <silent> <F2> <Esc>:GoImports <CR> <bar> :execute ":!goimports -w -v " . bufname('%')<CR> <bar>  :w<CR>
autocmd FileType go nmap <buffer> <silent> <F2> :GoImports <CR> <bar> :execute ":!goimports -w -v " . bufname('%')<CR> <bar> :w<CR>

" <F7> run tox PEP8/Go-lint
nmap <silent> <F7> :!tox -epep8 <CR>
imap <silent> <F7> <Esc>:!tox -epep8 <CR>
autocmd FileType go nmap <buffer> <silent> <F7> :GoMetaLinter <CR>
autocmd FileType go imap <buffer> <silent> <F7> <Esc>:GoMetaLinter <CR>
" a<F7> run Go-vet
autocmd FileType go nmap <buffer> <silent> a<F7> :execute ":!go vet " . bufname('%')<CR>
autocmd FileType go imap <buffer> <silent> a<F7> <Esc>:execute ":!go vet " . bufname('%')<CR>

" <F7> x2 run tox -epy36 / go test
nmap <silent> <F7><F7> :!rm -r .testrepository; tox -epy36<CR>
imap <silent> <F7><F7> <Esc>:!rm -r .testrepository; tox -epy36<CR>
" <g,t> run go test single func
autocmd FileType go nmap <buffer> <silent> <F7><F7> :GoTestFunc <CR>
autocmd FileType go imap <buffer> <silent> <F7><F7> <Esc>:GoTestFunc <CR>

" <F9> compile LaTeX
autocmd FileType tex nmap <buffer> <silent> <F9> :!docker run --rm -it -v $(pwd):/home danteev/texlive texliveonfly -c latexmk -a "-pdf -f -synctex=0" %<CR>

" <ESC> x2/x3 exit or force exit discarding changes
nmap <Esc><Esc> :q<CR>
nmap <Esc><Esc><Esc> :q!<CR>

" <h> / <h,h> show git diff for open file to HEAD / HEAD~ 
nmap <silent> <unique> h :!git difftool @ %<CR>
nmap <silent> <unique> hh :!git difftool @~ %<CR>
" <h,g> / <h,h,g> show full git diff to HEAD/HEAD~ 
nmap <silent> <unique> hg :!git difftool @<CR>
nmap <silent> <unique> hhg :!git difftool @~<CR>
" <F4> show git info for the commit that introduced selected line
" <F4> x2 - difftool for the commit that introduced selected line
nmap <silent> <F4> :execute ":!git show $(git blame " bufname('%') " -L " line('.') "\|head -1\|awk '{print $1}')"<CR>
imap <silent> <F4> <Esc>:execute ":!git show $(git blame " bufname('%') " -L " line('.') "\|head -1\|awk '{print $1}')"<CR>
nmap <silent> <F4><F4> :execute ":!c=$(git blame " . bufname('%') " -L " . line('.') "\|head -1\|awk '{print $1}'); git difftool ${c}~ $c " . bufname('%')<CR>
imap <silent> <F4><F4> <Esc>:execute ":!c=$(git blame " . bufname('%') " -L " . line('.') "\|head -1\|awk '{print $1}'); git difftool ${c}~ $c " . bufname('%')<CR>


" <TAB>(edit mode) use smart autocomplete
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

au VimEnter * call MRUIfEmpty()

"vim plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } "requires at least Vim 8.0.1453
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-unimpaired'
Plug 'touv/vim-arrow'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pythoncomplete'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'  "requries exuberant-ctags
Plug 'osyo-manga/vim-brightest'
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

function! ToggleFoldLevels(level)
    if &foldlevel || a:level != 0
        let cmd = 'setlocal foldlevel=' . a:level
        exe cmd
    else
        setlocal foldlevel=1
    endif
endfunction

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function MRUIfEmpty()
    if @% == ""
        " No filename for current buffer
        :MRU
    elseif filereadable(@%) == 0
        " File doesn't exist yet
        execute ":MRU " . argv(0)
    elseif line('$') == 1 && col('$') == 1
        " File is empty
        :MRU
    endif
endfunction
