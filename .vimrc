"vim plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } "requires at least Vim 8.0.1453
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-unimpaired'
Plug 'touv/vim-arrow'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/pythoncomplete'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'  "requries exuberant-ctags
Plug 'osyo-manga/vim-brightest'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'airblade/vim-gitgutter'
Plug 'rdolgushin/groovy.vim'
Plug 'tsony-tsonev/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'kana/vim-submode'
Plug 'elzr/vim-json'
call plug#end()

filetype plugin indent on " load filetype-specific indent files
filetype on
syntax enable             " enable syntax processing
syntax on

autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType go set omnifunc=go#complete#Complete
autocmd FileType go set foldlevel=1  " vim-go resets all folds on save...
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby set foldlevel=3  " vim-go resets all folds on save...
autocmd FileType sh set foldmethod=indent  " vim-go resets all folds on save...
autocmd FileType json set foldlevel=2
autocmd FileType yaml set foldlevel=3 " fits the best ansible playbooks
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.rst setlocal textwidth=80
autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal textwidth=71

let &t_TI = ""
let &t_TE = ""

augroup at_end_of_vim_setup
    let &winheight = &lines * 5 / 10 + 1
    let &winminheight = 5
    vert resize | resize
augroup END

augroup restorezoom
    autocmd WinEnter * silent! :call ToggleZoom(v:false)
augroup END

""augroup at_enter
""    autocmd VimEnter * call MRUIfEmpty()
""augroup END

set updatetime=100      " faster work of git plugin
set encoding=UTF-8
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

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let g:GetFileIgnoreList = ['*.o', '*.pyc', '*/tmp/*', '*~', '*/.git/*', '*/.tox/*', '*/build/*', '*/.testr/*', '*#']
set includeexpr=substitute(v:fname,'\|.*','','g')
set foldmethod=syntax   " folding blocks of code
set mmp=5000            " https://github.com/vim/vim/issues/2049
set splitbelow          " open new split panes to right and bottom (more natural)
set splitright

"vim-go visual effects
let g:go_mod_fmt_autosave = 1
let g:go_fmt_autosave = 1
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
\ "yml" : 1,
\ "json" : 1,
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
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeShowIgnoredStatus = 0
let g:DevIconsEnableFoldersOpenClose = 0
let g:NERDTreeSyntaxEnabledExtensions = ['*']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeMapNextHunk = "]]"
let g:NERDTreeMapPrevHunk = "[["
let g:NERDTreeMapOpenVSplit = '<C-v>'
let g:NERDTreeMapOpenSplit='<C-x>'
let g:NERDTreeChDirMode=2
let g:NERDTreeMapPreview='p'
let g:NERDTreeMapOpenInTab = '<C-t>'

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?",
    \ }

let g:snipMate = { 'snippet_version' : 1 }

"NOTE: describes mappings from ~/.vim/after/plugin/remap.vim
" vim <some_file>: starts as usual
" vim w/o args: starts from NERTtree window to pick files
" vim s foo: starts from MRU windows to pick files by foo filter
"  --- hotkey bindings ---
" <TAB> move across viewports (<C-PgUp/PgDn> for tabs)
" <a, TAN> pick a viewport to switch into from a list
" (N)<SPACE> toggle folding levels to min/max or a custom N
"   F.e: 3<SPACE> - sets folding level to 3
" <o> or <kp*> fold/unfold toggle
" <kp+> / <kp-> move to the next/prev closed fold block
" <]]> / <[[> move to the next/prev diff chunk block
" <x> toggle zoom of a viewport in/out
" <qq> close non active (all but this one) viewports
" <Backspace> go back to previous file (swaps two files in a loop)
" <F3> x1/x2/x3 browse a file in ./NERDtree/history (single/double/tripple press)
" <p> / <C-t> / <C-x> / <C-v> preview/open a picked file in a tab/split/vsplit viewport
" <gm/n/s> search next modified/new/staged file in git repo (in NERDtree)
" <a,F3> open alternative view for history ( <o> to open file in a viewport)
" <ww> / <w> swap words forward/back
" <C-a(,a)> toggle ON/OFF paste mode
" <C-n(,n)> toggle line numbers
"<C-x> align 'x = y' assignments (Ruby/Puppet'ish, '=>' is auto)
" <SPACE> x2 turn off search highlight
" <F5> x1/x2 show goguru callees or what implements a func/method (slow&faily!)
" <F1> go straight to the definition (go back on backspace)
" <a,F1> show goguru global referers for an entity
" <F8> show go doc
" <F6> toggle tags bar view
" <Shift-F6> toggle alt bar to show only declarations
"for python install ftplugin/python.vim manually
" <F2> save, save & exit (and run goimports) on double press
" <F7> run tox PEP8/Go-lint
" <Shift-F7> run Go-vet
" <F7> x2 run tox -epy36 / go test
" <g,t> run go test single func
" <F9> compile LaTeX
" <ESC> x2 exit window
" <h> / <h,h> show git diff for open file to HEAD / HEAD~
" <h,g> / <h,h,g> show full git diff to HEAD/HEAD~
" <F4> show git info for the commit that introduced selected line
" <F4> x2 - difftool for the commit that introduced selected line
" <TAB>(edit mode) use smart autocomplete
imap <silent> <Tab> <c-r>=Smart_TabComplete()<CR>
" <Shift-TAB>(edit mode) autocomplete from available snippets only
" <a,F5> tell gogetguru to fix things after failed F5
" <a, o> hide all {.*} blocks (undo with u)
" <c, o> hide all ^#<code> blocks (undo with u)

"Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

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

"allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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
        setlocal foldlevel=2
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
        let substr = matchstr(argv(0), "^s$")
        if (strlen(substr)!=0)
            execute ":MRU " . argv(1)
        else
            :MRU
        endif
    elseif line('$') == 1 && col('$') == 1
        " File is empty
        :MRU
    endif
endfunction

function ParseMessages()
    redir! >/tmp/vim_messages
    exec "filter 'could not import' messages"
    redir END
    exec ":!cat /tmp/vim_messages \| sort -u \| grep -oE \"could not import \\S+\" \| awk '{printf \"gogetguru: extracting \"$NF\"@master\\n\"}'\|gogetguru"
endfunction

function NERDTreeToggleSmart()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        silent NERDTreeToggle
    else
        silent NERDTreeFind
    endif
endfunction
