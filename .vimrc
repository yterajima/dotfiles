".vimrc for e2esound

"set verbosefile=~/vimlog
syntax on
filetype indent on
filetype plugin on

"load colorscheme
colorscheme e2esound

set iminsert=0
set number
set browsedir=buffer
set nocompatible
set hidden
set incsearch
set smartcase
set wrapscan
set imsearch=0
set hlsearch
noremap <esc><esc> :nohlsearch<CR><esc>

set nolist
au FileType html setlocal list

set listchars=eol:$,tab:>\ ,extends:<

set tabstop=2
set expandtab
au FileType php,html,css setlocal noexpandtab
set shiftwidth=2
set autoindent
set cindent
set fileformat=unix
set backspace=2
set whichwrap=b,s,h,l,<,>,[,]
set formatoptions+=mM
set showmatch
set noswapfile
set nobackup
set autoread
set wildmenu
set cmdheight=2
set showcmd
set statusline=\%t\%=\[%l/%L]\[%{&filetype}]\[%{&fileencoding}]
set laststatus=2
set notitle

set diffopt=filler,iwhite
set nf=
set splitbelow
set visualbell t_vb=
set diffopt-=filler diffopt=iwhite,horizontal
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le

au FileType gitcommit,hgcommit setlocal textwidth=72
au FileType rst setlocal textwidth=80
au FileType javascript,coffee setlocal textwidth=80
au FileType php setlocal textwidth=80
if exists('&colorcolumn')
  au FileType rst,gitcommit,hgcommit setlocal colorcolumn=+1
endif

"Popup Color
highlight PMenu ctermbg=0
highlight PMenuSel ctermbg=4
highlight PMenuSbar ctermbg=0
highlight PMenuThumb ctermbg=0

"折り畳み設定
set foldenable
set foldmethod=syntax
"set foldlevel=1
set fillchars=vert:\1
au FileType gitcommit,hgcommit,ref-refe,ref-phpmanual set nofoldenable
au FileType scss,css setlocal foldmethod=marker foldmarker={,}
au FileType html,xhtml set foldmethod=indent

"php限定設定
let php_sql_query=1     "文字列中のSQLをハイライト

"sudoで保存
command! Sudow :w !sudo tee >/dev/null %

"既に開いているファイルを再度開かない
if filereadable("macros/editexisting.vim")
  runtime macros/editexisting.vim
endif

"英字キーボード用
noremap ; :
noremap : ;

"十字キー無効化
inoremap <Right> <Nop>
inoremap <Left> <ESC>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

imap <> <><Left>

"buffer
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>l :ls<CR>

au BufWritePost *.php call PHPLint()
au BufWritePost *.rb call RubyLint()
au FileType php noremap <C-l> :call PHPLint()<CR>
au FileType ruby noremap <C-l> :call RubyLint()<CR>

au Filetype php imap <buffer> <? <?php
au FileType * imap <buffer> , , 
set complete+=k
au BufWritePre *.php,*.rb,*.js,*.bat,*.css,*.py call RTrim()
au BufWritePre * call LTrim()
au BufWritePre *.sass,*.scss call SassCorrect()
au BufWritePre *.php,*.js,*.html,*.rb,*.css,*.py setlocal fileformat=unix
au BufWritePre *.php,*.js,*.rb,*.py setlocal fenc=UTF-8

"CD.vim
au BufEnter * execute ":lcd " . expand("%:p:h")

function! PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction

function! RubyLint()
  let result = system( &ft . ' -c ' . bufname(""))
  echo result
endfunction

"行末のスペース&tab削除
function! RTrim()
  let s:cursor = getpos(".")
  if &filetype == "markdown"
    match Underlined /\s\{2}$/
    %s/\s\+\(\s\{2}\)$/\1/e
  else
    %s/\s\+$//e
  endif
  call setpos(".", s:cursor)
endfunction

"行頭のスペース&tab削除
function! LTrim()
  let s:cursor = getpos(".")
  %s/^(\t|\s)\+$//e
  call setpos(".", s:cursor)
endfunction

"Sassで:の後に必ず1スペース入れる
function! SassCorrect()
  let s:cursor = getpos(".")
  %s/\(\S\+\):\s\+\(.\+$\)/\1:\2/e
  %s/\([^\s\t:]\+\):\(\/\/\|link\|visited\|active\|hover\|focus\|lang\|before\|after\|first\-line\|first\-letter\|first\-child\|last\-child\|target\|enabled\|disabled\|checked\|indeterminate\|root\|nth\-child\(.\+\)\|nth\-last\-child\(.\+\)\|nth\-of\-type\(.\+\)\|nth\-last\-of\-type\(.\+\)\|first\-of\-type\|last-of\-type\|only\-child\|empty\|contains\(\)\|not\(\)\)\@!/\1: \2/e
  call setpos(".", s:cursor)
endfunction
