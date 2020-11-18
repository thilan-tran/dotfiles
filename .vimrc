" Thilan Tran 2020
"
"       ___________________/\/\___________________________________________
"      _______/\/\__/\/\__________/\/\/\__/\/\____/\/\__/\/\____/\/\/\/\_
"     _______/\/\__/\/\__/\/\____/\/\/\/\/\/\/\__/\/\/\/\____/\/\_______
"    _/\/\____/\/\/\____/\/\____/\/\__/\__/\/\__/\/\________/\/\_______
"   _/\/\______/\______/\/\/\__/\/\______/\/\__/\/\__________/\/\/\/\_
"  __________________________________________________________________
"
" ==================================================================

" General Settings {{{1

" sessions
let g:session_dir = '~/vimfiles/sessions'

" UI
syntax on
set background=dark
set showtabline=2

filetype plugin indent on
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set wildignore=*~,*.DAT,ntuser*,NTUSER*,_.sw*,*.json,node_modules/

" misc
set autochdir
set timeoutlen=500
set lazyredraw
set autoread
set nobackup
set noswapfile

" numbers and lines
set relativenumber
set cursorline
set ruler
set signcolumn=yes

" tabs and indent
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set breakindent
set backspace=indent,eol,start

" minimal status
set noshowcmd
set noshowmode
set laststatus=2
set shortmess=Fat " shorten messages
set hidden " hide buffers

" completion
set pumheight=7
set complete-=t " don't scan tags
set completeopt=menuone,noselect
set wildmenu
set wildcharm=<Tab>

" searching
set incsearch
set ignorecase
set smartcase
set nohlsearch

" split
set splitbelow
set splitright

" conceal for markdown
set conceallevel=2
set concealcursor=nv " modes to conceal text

" format options
set formatoptions+=t " autowrap by textwidth
set formatoptions-=l " autowrap long lines
set formatoptions-=o " no auto insert comments

" }}}
" Filetype Settings {{{1

augroup Misc
  autocmd!
  autocmd BufWritePre * call <SID>StripWhitespace()
augroup end

augroup Help
  autocmd!
  autocmd FileType help setlocal nomodeline
augroup end

augroup Vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup end

augroup Python
    autocmd!
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
augroup end

augroup CStyle
  autocmd!
  autocmd FileType c,cpp setlocal cinoptions+=L0 " fix :: indent in C

  autocmd FileType c,cpp,javascript setlocal nofoldenable

  " auto expand /* */ comments
  autocmd FileType c,cpp,javascript inoremap /* /*<Tab>*/<C-g>U<Left><C-g>U<Left><C-g>U<Left>
augroup end

augroup Markdown
  autocmd!
  autocmd BufReadPost,BufNewFile *.md,*.markdown set filetype=markdown

  " autoexpand math in Pandoc
  autocmd FileType markdown inoremap <buffer> $ $$<C-g>U<Left>
  autocmd FileType markdown inoremap <buffer> <M-$> $

  " auto spellcheck, columns
  " autocmd FileType markdown setlocal spell spelllang=en_us
  " autocmd FileType markdown setlocal textwidth=80
augroup end

augroup Text
  autocmd!
    " auto spellcheck, columns
    " autocmd FileType text setlocal spell spelllang=en_us
    autocmd FileType text setlocal textwidth=80
    autocmd FileType text setlocal colorcolumn=80

    " quick format to textwidth
    autocmd FileType text nmap <buffer> <Tab> mz{gq}`z
    " autocmd FileType text imap <buffer> <C-S-CR> <CR><CR><C-o>gq{
augroup end

" }}}
" Functions {{{1

" auto delete matching pair
function! s:DeleteMatchingPair()
  let line = getline(".")
  let prevpos = col(".")-2
  let previous = line[prevpos]
  let next = line[prevpos+1]
  let save = getpos(".")

  if previous ==# "{" || previous ==# "[" || previous ==# "("
    normal! h%x
  elseif previous ==# "'" || previous ==# "\"" || previous ==# "`"
    if next ==# "'" || next ==# "\"" || next ==# "`"
      execute "normal! x"
    else
      execute "normal! f" . previous . "x"
    endif
  endif
  call setpos(".", save)
  return ""
endfunction

function! s:StripWhitespace()
  let save_cursor = getpos(".")
  :%s/\s\+$//e
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

" }}}
" Mappings {{{1

let mapleader = ";"

" swap ; and , to use ; as leader
nnoremap , ;
nnoremap ;, ,

" Editing {{{2

" colonize (TODO: fix functionality in terminal vim)
inoremap <S-CR> <C-o>A;
inoremap <C-CR> <C-o>A;<CR>

" cgn current word
nnoremap <silent> c<Tab> :let @/=expand('<cword>')<CR>cgn

" quick substitution
nnoremap gs :s///g<Left><Left><Left>
nnoremap gS :%s///gc<Left><Left><Left><Left>

" stay in Visual mode when using shift commands
xnoremap < <gv
xnoremap > >gv

" smart backspace to auto delete matching pair
inoremap <silent> <BS> <C-r>=<SID>DeleteMatchingPair()<CR><C-h>

" auto close pairs, <C-g>U prevents <Left> from breaking the undo sequence
inoremap ' ''<C-g>U<Left>
inoremap " ""<C-g>U<Left>
inoremap ` ``<C-g>U<Left>

inoremap ] []
inoremap [ []<C-g>U<Left>
inoremap [; [];<C-g>U<Left><C-g>U<Left>

inoremap ) ()
inoremap ( ()<C-g>U<Left>
inoremap (; ();<C-g>U<Left><C-g>U<Left>

inoremap } {}
inoremap { {}<C-g>U<Left>
inoremap {; {};<C-g>U<Left><C-g>U<Left>

inoremap {<CR> {<CR>}<C-c>O
inoremap {;<CR> {<CR>};<C-c>O

" M-key for single insertion in gVim
inoremap ¨ (
inoremap © )
inoremap û {
inoremap ý }
inoremap Û [
inoremap Ý ]

" M-key for single insertion in terminal vim
inoremap <M-(> (
inoremap <M-)> )
inoremap <M-{> {
inoremap <M-}> }
inoremap <M-[> [
inoremap <M-]> ]
inoremap <M-'> '
inoremap <M-"> "
inoremap <M-`> `

" }}}
" Movement {{{2

" mimic vinegar
nnoremap <silent> - :Explore<CR>

" previous buffer
nnoremap <BS> :e#<CR>

" wrap j and k
nmap j gj
nmap k gk

" window movement
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-Right> :vertical resize -5<CR>
nnoremap <C-Left> :vertical resize +5<CR>
nnoremap <C-Up> :res -5<CR>
nnoremap <C-Down> :res +5<CR>

" buffer movement
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader><S-Tab> :bprev<CR>

" M-hjkl for alternate arrows in gVim
noremap ë <Up>
noremap ê <Down>
noremap è <Left>
noremap ì <Right>
inoremap ë <Up>
inoremap ê <Down>
inoremap è <Left>
inoremap ì <Right>
cnoremap ë <Up>
cnoremap ê <Down>
cnoremap è <Left>
cnoremap ì <Right>

" M-hjkl for alternate arrows in terminal vim
noremap <M-k> <Up>
noremap <M-j> <Down>
noremap <M-l> <Right>
noremap <M-h> <Left>
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-l> <Right>
inoremap <M-h> <Left>
cnoremap <M-k> <Up>
cnoremap <M-j> <Down>
cnoremap <M-l> <Right>
cnoremap <M-h> <Left>

" }}}
" Leader Mappings {{{2

noremap <silent> <leader>rc :edit $MYVIMRC<CR>
noremap <leader>so :source $MYVIMRC<CR>

noremap <silent> <leader>e :Explore<CR>
noremap <silent> <leader>o <C-w>o
noremap <silent> <leader>w :w!<CR>
noremap <silent> <leader>c :close<CR>
noremap <silent> <leader>q :qa<CR>

" buffers
noremap <silent> <leader>; :buf <Tab>
nnoremap <silent> <leader>bc :bd<CR>
nnoremap <silent> <leader>bo :%bd\|e#\|bd#<CR>
nmap <silent> <leader>bs :split<CR><C-w><C-k>-
nmap <silent> <leader>bv :vsplit<CR><C-w><C-h>-
" refresh buffer
noremap <silent> <leader>re ma:e<CR>`azAzz

" paste from system clipboard
noremap <leader>P "*P
noremap <leader>p "*p

" yank to system clipboard
vnoremap <leader>y "*y
nnoremap <leader>y "*yy

" spell
noremap <silent> <leader>sp :setlocal spell! spelllang=en_us<CR>
" fix next and previous spelling errors
noremap <leader>fn mz]s1z=`z
noremap <leader>fp mz[s1z=`z

" }}}
" Other {{{2

" vertical help
cabbrev vh vert help

" bash command from windows
cabbrev !b !bash -c " "<Left><Left>

" quick save session
execute 'nnoremap <leader>ss :mks! ' . g:session_dir . '/*.vim<C-d><Left><Left><Left><Left><BS>'

" }}}

" }}}
" Terminal {{{1

" automatically focus into terminal buffer
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

" vertical split and open terminal
noremap <silent> <leader>te
      \ :vsplit<CR>
      \ :terminal bash<CR>
      \ :set nonumber<CR>
      \ :file bash<CR>i

" tmux normal mode mapping
tnoremap <silent> <leader>[ <C-\><C-n>
" paste from system clipboard
tnoremap <silent> <leader>v <C-\><C-n>"*pi
" paste from vim clipboard
tnoremap <silent> <leader>p <C-\><C-n>""pi

" replicate window movement commands
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-Right> <C-\><C-n>:vertical resize -5<CR>
tnoremap <C-Left> <C-\><C-n>:vertical resize +5<CR>
tnoremap <C-Up> <C-\><C-n>:res -5<CR>
tnoremap <C-Down> <C-\><C-n>:res +5<CR>

" replicate buffer commands
tnoremap <silent> <leader>o <C-\><C-n><C-w>o
tnoremap <silent> <leader>c <C-\><C-n>:close<CR>
tnoremap <silent> <leader>bc <C-\><C-n>:bd!<CR>
tnoremap <silent> <leader><Tab> <C-\><C-n>:bnext<CR>
tnoremap <silent> <leader><S-Tab> <C-\><C-n>:bprev<CR>

" }}}
