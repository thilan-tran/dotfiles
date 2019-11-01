" Thilan Tran Vim config
set nocompatible

" gui options
if (has('gui_running'))
  set guifont=Iosevka:h20
  " set guifont=Monoid:h13
  " set guifont=Fantasque\ Sans\ Mono:h20
  " set guifont=Fira\ Code:h15
  " set guifont=Dank\ Mono:h18
  " set guifont=Operator\ Mono\ Book:h20
  set renderoptions=type:directx " ligatures
  set guioptions-=m  " menu bar
  set guioptions-=T  " toolbar
  set guioptions-=r  " scrollbar
endif

" colors
if exists('$TMUX')
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set t_ZH=[3m
  set t_ZR=[23m
endif

if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_SR = "\ePtmux;\e\e[3 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"

  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\e[5 q"
  let &t_SR = "\e[3 q"
  let &t_EI = "\e[1 q"

  " let &t_SI = "\e[5 q"
  " let &t_SR = "\e[3 q"
  " let &t_EI = "\e[2 q"
endif

" plugins
" call plug#begin('~/vimfiles/plugged')
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plug 'vim-scripts/TeTrIs.vim'

Plugin 'joshdick/onedark.vim'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'chriskempson/base16-vim'
" Plugin 'kaicataldo/material.vim'
" Plugin 'drewtempelmeyer/palenight.vim'
" Plugin 'arcticicestudio/nord-vim'

Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'
Plugin 'mhinz/vim-startify'
Plugin 'metakirby5/codi.vim'

" Plug 'junegunn/rainbow_parentheses.vim'
Plugin 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

Plugin 'plasticboy/vim-markdown'
Plugin 'prashanthellina/follow-markdown-links'
Plugin 'jkramer/vim-checkbox'
Plugin 'dhruvasagar/vim-table-mode'

" Plug 'Konfekt/FastFold'
" Plug 'vimwiki/vimwiki'
" Plug 'jceb/vim-orgmode'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'pangloss/vim-javascript'
Plugin 'kh3phr3n/python-syntax'

" Plug 'maralla/completor.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ajh17/VimCompletesMe'
Plugin 'sirver/ultisnips'
" Plugin 'w0rp/ale'
Plugin 'maximbaz/lightline-ale'

" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'liuchengxu/vista.vim'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'mattn/emmet-vim'

" Plugin 'Lenovsky/nuake'
Plugin 'bkad/CamelCaseMotion'
" Plugin 'kkoenig/wimproved.vim'

" Plug 'godlygeek/tabular'
" Plug 'Shougo/vimproc.vim'
" Plug 'kana/vim-operator-user'

" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

" Plug 'tpope/vim-markdown'
" Plug 'gabrielelana/vim-markdown'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'lifepillar/vim-mucomplete'

" Plug 'Rip-Rip/clang_complete'
" Plug 'rhysd/vim-clang-format'
" Plug 'majutsushi/tagbar'

" Plug 'ludovicchabant/vim-gutentags'
" Plug 'neoclide/coc.nvim' ", {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'oblitum/YouCompleteMe',
" Plug 'ervandew/supertab'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'

" call plug#end()
call vundle#end()

" set rtp+=~/.fzf
" let g:completor_clang_binary = 'C:/Program Files/LLVM/bin/clang.exe'
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" fullscreen GUI on startup
augroup Startup
  autocmd!
  autocmd GUIEnter * simalt ~x
  autocmd GUIEnter * WToggleClean
  autocmd GUIEnter * call libcallnr("gvimfullscreen.dll.x64", "ToggleFullScreen", 0)
  " autocmd VimEnter * :Goyo
  " autocmd VIMEnter * :20Vexplore
augroup END

set number
set ruler
set signcolumn=no

set noshowmode
set laststatus=2
set shortmess=Fat
set autoread
set timeoutlen=400
set scrolloff=2

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

set nobackup
set noswapfile

set incsearch
set ignorecase
set smartcase

set wildcharm=<Tab>
set wildmenu

" set lazyredraw
set showmatch
set backspace=indent,eol,start

set splitbelow
set splitright

" set shell=bash
" set shellpipe=|
" set shellredir=>
" set shellcmdflag=

nnoremap <C-a>  :Nuake<CR>
inoremap <C-a> <C-\><C-n>:Nuake<CR>
tnoremap <C-a> <C-\><C-n>:Nuake<CR>
let g:nuake_position = 'right'
let g:nuake_size = 0.5

" fold options
set foldlevelstart=1
autocmd FileType c,cpp,python,javascript setlocal nofoldenable
autocmd FileType c,cpp,python,javascript setlocal signcolumn=yes
" fix auto fold during completion
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
autocmd FileType vim setlocal foldmethod=marker

filetype plugin indent on
set encoding=utf-8
set ff=unix
set fileformats=unix,dos
set wildignore=*~,*.DAT,ntuser*,NTUSER*,_.sw*,*.json,node_modules/

"fix :: indent in c
autocmd FileType cpp setlocal cinoptions+=L0

" let g:load_doxygen_syntax=1
syntax on
set background=dark
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
colorscheme onedark

" custom highlighting
highlight Comment gui=italic
highlight SpellLocal guifg=NONE
highlight MatchParen gui=bold
" yellow
highlight cIncluded guifg=#E5C07B
highlight TagbarHighlight guifg=#E5C07B
highlight SpellBad guifg=#E5C07B
" highlight cBraces guifg=#E5C07B
" highlight cDelimiter guifg=#E5C07B
" blue
highlight cppStructure guifg=#61AFEF
highlight cCustomClassName guifg=#61AFEF
highlight cCustomStructName guifg=#61AFEF
highlight cCustomStruct guifg=#61AFEF
highlight cCustomClass guifg=#61AFEF
highlight StartifyFile guifg=#61AFEF
" white
highlight Cursor guibg=#ABB2BF
highlight cUserLabel guifg=#ABB2BF
highlight TagbarPseudoID guifg=#ABB2BF
highlight StartifyPath guifg=#ABB2BF
" cyan
highlight cppType guifg=#56B6C2
highlight cppSTLtype guifg=#56B6C2
highlight cType guifg=#56B6C2
highlight cppBoolean guifg=#56B6C2
highlight cCustomClassKey guifg=#56B6C2
highlight cStructure guifg=#56B6C2
" red
highlight cCustomScope guifg=#E06C75
highlight cOperator guifg=#E06C75
highlight cStorageClass guifg=#E06C75
highlight cCustomAccessKey guifg=#E06C75
highlight TagbarAccessPrivate guifg=#E06C75
highlight TagbarVisibilityPrivate guifg=#E06C75
highlight pythonExtraOperator guifg=#E06C75
" green
highlight cCustomFunc guifg=#98C379
highlight cUserFunction guifg=#98C379
highlight cppSTLfunction guifg=#98C379
highlight TagbarAccessPublic guifg=#98C379
highlight TagbarVisibilityPublic guifg=#98C379
" grey
highlight doxygenBOther guifg=#5C6370

" markdown
autocmd BufReadPost,BufNewFile *.md,*.markdown set filetype=markdown
highlight htmlItalic cterm=italic ctermfg=yellow gui=italic guifg=#E5C07B
highlight htmlBold cterm=bold ctermfg=magenta gui=bold guifg=#C678DD
highlight htmlH1 cterm=bold ctermfg=blue gui=bold guifg=#61AFEF

" render whitespace
" set listchars=eol:·,tab:>·,trail:~,extends:>,precedes:<,space:·
" set list

" language highlighting options
let c_no_curly_error = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let python_self_cls_highlight = 1

" start screen
let g:startify_enable_special = 0
let g:startify_change_to_dir = 0
let g:startify_padding_left = 8
let g:startify_lists = [ { 'type': 'files' }, { 'type': 'sessions' }, { 'type': 'bookmarks' } ]
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'w': '/mnt/c/Users/qwert/vimwiki/index.md'} ]
let g:startify_custom_header = [
          \ ' ',
          \ ' ',
          \ ' ',
          \ '                                                    ',
          \ '                                __                  ',
          \ '                        __  __ /\_\    ___ ___      ',
          \ '                       /\ \/\ \\/\ \ /'' __` __`\   ',
          \ '                       \ \ \_/ |\ \ \/\ \/\ \/\ \   ',
          \ '                        \ \___/  \ \_\ \_\ \_\ \_\  ',
          \ '                         \/__/    \/_/\/_/\/_/\/_/  ',
          \ ' ',
          \ ]

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 75
let g:netrw_wiw = 20
let g:netrw_usetab = 1
let g:netrw_special_syntax = 0

let g:fzf_layout = { 'left': '~20%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore node_modules*'

let g:goyo_width = 150
let g:goyo_height = 300
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" let g:limelight_conceal_guifg = '#434959'
" let g:limelight_paragraph_span = 1

let g:lightline = { 'colorscheme': 'onedark' }
let g:lightline.component = {
      \  'time': "%{strftime('%I.%M')}" }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'buffers': 'tabsel',
      \ }
let g:lightline.active = { 'right': [ ['lineinfo'], ['percent'],
      \                               ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \                               ['fileformat', 'fileencoding', 'filetype', 'time'] ]}
let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_warnings = ''
let g:lightline#ale#indicator_errors = ''
let g:lightline#ale#indicator_ok = 'ok'

set showtabline=2
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline#bufferline#filename_modifier = ':t'

let g:vista_fzf_preview = ['right:10%']
" let g:vista_sidebar_position = 'vertical topleft'
let g:vista_sidebar_position = 'vertical topright'
let g:vista_echo_cursor = 0

" rainbow parentheses plugin
" augroup rainbow_c
"   autocmd!
"   autocmd FileType c,cpp,javascript RainbowParentheses
" augroup END
" let g:rainbow#max_level = 10
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

set conceallevel=2
set concealcursor=nv
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:markdown_folding = 1
let g:vim_markdown_fenced_languages = ['c++=cpp', 'py=python', 'js=javascript']

" vim-wiki
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_folding = ''
" let g:vimwiki_global_ext = 0
" autocmd FileType vimwiki set syntax=markdown | set filetype=markdown

let g:UltiSnipsSnippetDirectories = ['C:/Users/qwert/vimfiles/UltiSnips']
let g:UltiSnipsExpandTrigger = "<C-u>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<C-tab>'
let g:ulti_expand_or_jump_res = 0 "default value, just set once
" <CR> for ulti snip expand
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction
inoremap <silent> <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
" inoremap <silent> <expr> <plug>MyCR
"  	    \ mucomplete#ultisnips#expand_snippet("\<cr>")
" imap <cr> <plug>MyCR

let g:ale_sign_column_always = 0
let g:ale_sign_error = ' X'
let g:ale_sign_warning = ' -'
let g:ale_set_highlights = 1
let g:ale_completion_enabled = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_linters = {
  \'c': ['clang'],
  \'cpp': ['clang'],
  \'python': ['flake8'],
  \'javascript': ['jshint'] }
let g:ale_linters_explicit = 1
let g:ale_fixers = {
  \'*': ['remove_trailing_lines', 'trim_whitespace'],
  \'css': ['prettier'],
  \'html': ['prettier'],
  \'javascript': ['prettier'],
  \'c': ['clang-format'],
  \'cpp': ['clang-format']}
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: Chromium, ConstructorInitializerIndentWidth: 2, AllowShortFunctionsOnASingleLine: All, SpacesBeforeTrailingComments: 1, AlignTrailingComments: true, SortIncludes: false, AlignConsecutiveAssignments: true, ReflowComments: true, BinPackParameters: true, AlignAfterOpenBracket: true, AlignOperands: true, BreakBeforeBraces: Allman}"'

" lint options
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 1

" completion popup
set pumheight=7
set complete-=t
set complete-=i
set completeopt=menuone,noselect
setlocal shortmess+=c

" YCM
let g:ycm_clangd_binary_path = "C:/Program Files/LLVM/bin/clangd.exe"
let g:ycm_use_clangd = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_auto_trigger = 1
" let g:ycm_filetype_blacklist = {}
let g:ycm_min_num_indentifer_candidate_chars = 2
let g:ycm_min_num_of_chars_for_completion = 2

let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<C-Z>'
autocmd FileType html,css,markdown EmmetInstall

" set window preview height to always 1
set previewheight=1
au BufEnter ?* call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
    if &previewwindow
        exec 'setlocal winheight='.&previewheight
    endif
endfunc

" auto spellcheck, columns
" autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
" autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80

" vertical help
cabbrev h vert help
" recent edit
noremap <C-CR> `.
" table mode in markdown
autocmd FileType markdown inoremap <C-b> <C-o>:TableModeToggle<CR>
autocmd FileType markdown nmap <C-SPACE> :call checkbox#ToggleCB()<CR>

" auto close
inoremap ) ()
inoremap ( ()<Left>
inoremap (; ();<Left><Left>

inoremap } {}<Left>
inoremap { {<CR>}<C-c>O<space><space>
inoremap {; {<CR>};<C-c>O<space><space>

inoremap [ []<Left>
inoremap [; [];<Left><Left>

inoremap ¨ (
inoremap © )
inoremap û {
inoremap ý }
inoremap Û [
inoremap Ý ]

" colonize
inoremap <S-CR> <C-o>A;
inoremap <C-CR> <C-o>A;<CR>

" alternate arrows (mod - hjkl)
noremap ë <Up>
noremap ê <Down>
noremap è <Left>
noremap ì <Right>
inoremap ë <Up>
inoremap ê <Down>
inoremap è <Left>
inoremap ì <Right>

" CamelCase motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" leader keys
let mapleader = ";"
let localleader = "\\"
noremap <silent> <leader>s :Startify<CR>
noremap <silent> <leader>rc :vspl $MYVIMRC<CR>
noremap <leader>; :Files<CR>
noremap <leader>e :20Vexplore<CR>
noremap <silent> <leader>w :silent w!<CR>
noremap <leader>c :q<CR>
noremap <leader>q :qa<CR>
noremap <leader>x :e!<CR>
noremap <leader>t :Vista<CR>

" open tags in vertical window
noremap <A-]> :vsplit<CR> g<C-]>
noremap <leader>] :YcmCompleter GoTo<CR>

" refresh buffer
noremap <leader>re ma:edit<CR>`azAzz
" paste from system clipboard
noremap <leader>P "*P
noremap <leader>p "*p
tnoremap <C-P> <C-W>""
tnoremap <C-V> <C-W>"*
" fold/unfold
noremap <leader>u zA
noremap <leader>f zc

" buffers
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>bn :enew<CR> :Explore<CR>
nnoremap <leader>bs :split<CR> <C-W><C-K> :Explore<CR>
nnoremap <leader>bv :vsplit<CR> <C-W><C-H> :Explore<CR>
nnoremap <leader>bo :%bd<CR>:e#<CR>
nnoremap <leader>bc :bd<CR>
" buffer list
noremap <leader><tab> :buffer<space><tab>
" previous buffer
nnoremap <BS> :e#<CR>

noremap <silent> <leader>g :Goyo<CR>
noremap <silent> <leader>te :vert terminal ++close bash<CR>
noremap <silent> <leader>tb :TagbarToggle<CR>
noremap <silent> <leader>o :browse oldfiles<CR>
" browse errors
nnoremap <silent> <leader>k :ALEPreviousWrap<CR>
nnoremap <silent> <leader>j :ALENextWrap<CR>

" script compilation
nnoremap <silent> <leader><space>s :vert term ++close bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -s<CR>
nnoremap <silent> <leader><space>r :vert term bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -r<CR>
nnoremap <silent> <leader><space>b :vert term bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -p<CR>
nnoremap <silent> <leader><space>p :vert term ++close bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -z<CR>

" autocompile pdf from markdown and open viewer
autocmd FileType c,cpp,txt nnoremap <leader>bm :echo "Not md file"<CR>
autocmd FileType markdown nmap <silent> <C-S>
  \ ma <bar>
  \ :%s/```c++\\|```c++/\```c++/ge<CR>
  \ :%s/```/\```/ge<CR>
  \ :w!<CR>
  \ :term ++hidden ++close powershell pandoc "%:p" --pdf-engine=xelatex --listings -o "%:p:h"\\"%:t:r".pdf<CR>
  \ :%s/\```c++/```c++/ge<CR>
  \ :%s/\```/```/ge<CR>
  \ :w!<CR>
  \ :edit<CR>
  \ :echo "Compiling pdf..."<CR>
  \ `azA
  " \ :term ++hidden mupdf-gl -r 115 "%:p:h"\\"%:t:r".pdf<CR>
autocmd FileType c,cpp,txt nnoremap <silent> <leader>v :Goyo<CR>
autocmd FileType markdown,pdf nnoremap <silent> <leader>v :term ++hidden ++close powershell SumatraPDF -reuse-instance "%:p:h"\\"%:t:r".pdf<CR>

" window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Right> :vertical resize -5<CR>
nnoremap <C-Left> :vertical resize +5<CR>
nnoremap <C-Up> :res -5<CR>
nnoremap <C-Down> :res +5<CR>

" sessions
let g:session_dir = 'C:\Users\qwert\vimfiles\session'
exec 'nnoremap <leader>ss :mks! ' . g:session_dir . '\*.vim<C-D><left><left><left><left><BS>'

" check syntax highlight
nnoremap <leader>sy :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" toggle fullscreen
noremap <leader>r :call ToggleFullscreen()<CR>
function ToggleFullscreen()
  if &l:columns ># 85
    call libcallnr("gvimfullscreen.dll.x64", "ToggleFullScreen", 0)
    set lines=25 columns=85
  else
    call libcallnr("gvimfullscreen.dll.x64", "ToggleFullScreen", 0)
  endif
endfunction

" other options/plugins:

" set foldtext
set foldtext=MyFoldText()
fu! MyFoldText()
	let line = getline(v:foldstart)

	if line =~ '^----*$'
		let line = getline(v:foldstart+1)
	endif

	let indent = max([indent(v:foldstart)-v:foldlevel, 1])
	let lines = (v:foldend - v:foldstart + 1)
	let strip_line = substitute(line, '^//\|=\+\|["#]\|/\*\|\*/\|{{{\d\=\|title:\s*', '', 'g')
	let strip_line = substitute(strip_line, '^[[:space:]]*\|[[:space:]]*$', '', 'g')
	let text = strpart(strip_line, 0, winwidth(0) - v:foldlevel - indent - 6 - strlen(lines))
	if strlen(strip_line) > strlen(text)
		let text = text.'…'
	endif
	return repeat('▧', v:foldlevel) . repeat(' ', indent) . text .' ('. lines .')'
endfu

" deprecated options:

" clang-complete
" let g:clang_use_library=1
" let g:clang_library_path='C:/Program Files/LLVM/bin/'
" let g:clang_user_options = '-std=c++14'
" let g:clang_auto_select=2
" let g:clang_complete_auto=1
" let g:clang_complete_copen=1
" let g:clang_complete_optional_args_in_snippets=1
" let g:clang_close_preview=0
" let g:clang_omnicppcomplete_compliance=0
" let g:clang_complete_patterns=0
" let g:clang_complete_macros=0
" let g:clang_snippets=1
" let g:clang_conceal_snippets=1
" let g:clang_snippets_engine='clang_complete'

" let g:clang_format#style_options = {
"  \ "BinPackParameters" : "true",
"  \ "AlignAfterOpenBracket" : "true",
"  \ "AlignOperands" : "true",
"  \ "SortIncludes" : "false",
"  \ "ConstructorInitializerIndentWidth" : 2,
"  \ "Standard" : "Cpp11",
"  \ "BasedOnStyle" : "Chromium",
"  \ "AlignTrailingComments" : "true",
"  \ "ColumnLimit" : 0,
"  \ "SpacesBeforeTrailingComments" : 1,
"  \ "BreakBeforeBraces" : "Allman",
"  \ "AllowShortFunctionsOnASingleLine" : "All",
"  \ "AlignConsecutiveAssignments" : "true",
"  \ "ReflowComments" : "true" }

" mucomplete
" let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#completion_delay = 150
" let g:mucomplete#chains = {}
" let g:mucomplete#chains.default = ['ulti', 'path', 'keyn', 'omni']
" let g:mucomplete#chains.c = ['ulti', 'path', 'keyn', 'omni']
" let g:mucomplete#chains.cpp = ['ulti', 'path', 'keyn', 'omni']
" let g:mucomplete#chains.markdown = ['ulti', 'keyn']
" let g:mucomplete#chains.txt = ['ulti', 'keyn']
" let g:mucomplete#minimum_prefix_length = 2

" for youCompleteMe compatibility
" imap <expr> <right> mucomplete#extend_fwd("\<right>")
" imap <unique> <c-j> <plug>(MUcompleteCycFwd)
" imap <unique> <c-k> <plug>(MUcompleteCycBwd)
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
" let g:SuperTabDefaultCompletionType = "<c-n>"

" function
":vert term mupdf ":p:h"\\"%:t:r".pdf<CR>
" map <leader>sc :call RunBuild(expand('%:p'))<CR>
" function RunBuild(path)
"   exe ":terminal bash"
" endfunction

" coc.vim
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"  " use <c-space>for trigger completion
" imap <c-space> coc#refresh()
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" LSP clangd
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'clangd',
"         \ 'cmd': {server_info->['clangd']},
"         \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"         \ })
" endif

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" use <tab> for trigger completion and navigate to next complete item
"function! s:check_back_space() abort
 " let col = col('.') - 1
 " return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
