" put it into ~/.vim/after/plugin/remap.vim
" that ensures in remaps any mappings in plugins
nnoremap <silent> <Tab> <C-w><C-w>
nnoremap <silent> a<Tab> :W<CR>
nnoremap <silent> <space> :<C-U>call ToggleFoldLevels(v:count)<CR>
nmap <silent> <unique> o za
nmap <silent> <unique> * za
nnoremap <silent> <unique> + :call NextClosedFold('j')<CR>
nnoremap <silent> <unique> - :call NextClosedFold('k')<CR>
nnoremap <silent> <unique> x :call ToggleZoom(v:true)<CR>
nmap <silent> <unique> qq <C-w>o
nmap <silent> <unique> <BS> :e#<CR>
nmap <silent> <unique> <F3> :Files! <CR>
imap <silent> <unique> <F3> <Esc>:Files! <CR>
nmap <silent> <unique> <F3><F3> :NERDTreeToggle <CR>
imap <silent> <unique> <F3><F3> <Esc>:NERDTreeToggle <CR>
nmap <silent> <unique> <F3><F3><F3> :History <CR>
imap <silent> <unique> <F3><F3><F3> <Esc>:History <CR>
nmap <silent> <unique> a<F3> :MRU <CR>
nmap <silent> ww "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nmap <silent> w "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nmap <silent> <C-A> :setlocal paste<CR>
nmap <silent> <C-A>a :setlocal nopaste<CR>
nmap <silent> <C-N> :setlocal number<CR>
nmap <silent> <C-N>n :setlocal nonumber<CR>
imap <silent> <C-A> <Esc>:setlocal paste<CR>
imap <silent> <C-A>a <Esc>:setlocal nopaste<CR>
imap <silent> <C-N> <Esc>:setlocal number<CR>
imap <silent> <C-N>n <Esc>:setlocal nonumber<CR>
"nmap <silent> <C-X> :Tab /=<CR>
"imap <silent> <C-X> <Esc>:Tab /=<CR>
nnoremap <space><space> :nohlsearch<CR>
autocmd FileType go nmap <silent> <F5><F5> :GoImplements <CR>
autocmd FileType go nmap <silent> <F5> :GoCallees <CR>
autocmd FileType go imap <silent> <F5><F5> <Esc>:GoImplements <CR>
autocmd FileType go imap <silent> <F5> <Esc>:GoCallees <CR>
autocmd FileType go nmap <silent> <F1> :GoDef <CR>
autocmd FileType go imap <silent> <F1> <Esc>:GoDef <CR>
autocmd FileType go nmap <silent> a<F1> :GoReferrers <CR>
autocmd FileType go nmap <silent> <F8> :GoDoc <CR>
autocmd FileType go imap <silent> <F8> <Esc>:GoDoc <CR>
nmap <silent> <F6> :TagbarToggle<CR>
imap <silent> <F6> <Esc>:TagbarToggle<CR>
nmap <silent> <S-F6> :GoDecls<CR>
imap <silent> <S-F6> <Esc>:GoDecls<CR>
imap <silent> <F2> <Esc>:w<CR>
nmap <silent> <F2> :w<CR>
imap <silent> <F2><F2> <Esc>:wq<CR>
nmap <silent> <F2><F2> :wq<CR>
autocmd FileType go imap <buffer> <silent> <F2><F2> :execute ":!goimports -w -v " . bufname('%')<CR> <bar> :wq<CR>
autocmd FileType go nmap <buffer> <silent> <F2><F2> :execute ":!goimports -w -v " . bufname('%')<CR> <bar> :wq<CR>
nmap <silent> <F7> :!tox -epep8 <CR>
imap <silent> <F7> <Esc>:!tox -epep8 <CR>
autocmd FileType go nmap <buffer> <silent> <F7> :GoMetaLinter <CR>
autocmd FileType go imap <buffer> <silent> <F7> <Esc>:GoMetaLinter <CR>
autocmd FileType go nmap <buffer> <silent> <S-F7> :execute ":!go vet " . bufname('%')<CR>
autocmd FileType go imap <buffer> <silent> <S-F7> <Esc>:execute ":!go vet " . bufname('%')<CR>
nmap <silent> <F7><F7> :!rm -r .testrepository; tox -epy36<CR>
imap <silent> <F7><F7> <Esc>:!rm -r .testrepository; tox -epy36<CR>
autocmd FileType go nmap <buffer> <silent> <F7><F7> :GoTestFunc <CR>
autocmd FileType go imap <buffer> <silent> <F7><F7> <Esc>:GoTestFunc <CR>
autocmd FileType tex nmap <buffer> <silent> <F9> :!docker run --rm -it -v $(pwd):/home danteev/texlive texliveonfly -c latexmk -a "-pdf -f -synctex=0" %<CR>
nmap <Esc><Esc> :q<CR>
nmap <silent> <unique> h :!git difftool @ %<CR>
nmap <silent> <unique> hh :!git difftool @~ %<CR>
nmap <silent> <unique> hg :!git difftool @<CR>
nmap <silent> <unique> hhg :!git difftool @~<CR>
nmap <silent> <F4> :execute ":!git show $(git blame " bufname('%') " -L " line('.') "\|head -1\|awk '{print $1}')"<CR>
imap <silent> <F4> <Esc>:execute ":!git show $(git blame " bufname('%') " -L " line('.') "\|head -1\|awk '{print $1}')"<CR>
nmap <silent> <F4><F4> :execute ":!c=$(git blame " . bufname('%') " -L " . line('.') "\|head -1\|awk '{print $1}'); git difftool ${c}~ $c " . bufname('%')<CR>
imap <silent> <F4><F4> <Esc>:execute ":!c=$(git blame " . bufname('%') " -L " . line('.') "\|head -1\|awk '{print $1}'); git difftool ${c}~ $c " . bufname('%')<CR>
imap <silent> <S-Tab> <Plug>snipMateShow
nnoremap <silent> <unique> a<F5> :call ParseMessages()<CR>
nmap <silent> ]] :GitGutterNextHunk<CR>
nmap <silent> [[ :GitGutterPrevHunk<CR>
nmap <silent> gn /✭<CR>
nmap <silent> gm /✹<CR>
nmap <silent> gs /✚<CR>
nmap <silent> ao :%s/{.*}/{...}/g<CR>
nmap <silent> co :%s/^#\S.*/#.../g<CR>
