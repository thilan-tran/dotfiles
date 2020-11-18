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

" gVim & nvim {{{1

" custom font and other gVim options
if (has('gui_running'))
  set guifont=Iosevka:h20
  set renderoptions=type:directx " ligatures in gVim
  set guioptions-=m " hide menu bar
  set guioptions-=T " hide toolbar
  set guioptions-=r " hide scrollbar
endif

" runtimepath for nvim
set rtp+=~/.config/nvim/

" }}}
" Plugged {{{1

call plug#begin('~/vimfiles/plugged')

" autocomplete, snippets, and formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
Plug 'rhysd/vim-clang-format'

" lightweight autocomplete
" Plug 'ajh17/VimCompletesMe'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jkramer/vim-checkbox'

" FZF and tags
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'

" directory browser
Plug 'justinmk/vim-dirvish'

" git
" Plug 'airblade/vim-gitgutter'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'

" syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'justinmk/vim-syntax-extra'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'mxw/vim-jsx'
" Plug 'leafgarland/typescript-vim'
Plug 'pfdevilliers/Pretty-Vim-Python'

Plug 'uiiaoo/java-syntax.vim'

" statusline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" startup page
Plug 'mhinz/vim-startify'

" goyo
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

" other utilities
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'       " allows for async make
Plug 'bkad/CamelCaseMotion'
" Plug 'tmhedberg/SimpylFold'     " much faster folding
Plug 'psliwka/vim-smoothie'     " smooth scroll
Plug 'godlygeek/tabular'        " text alignment
Plug 'bruno-/vim-vertical-move' " vertical movement in visual modes

call plug#end()

" }}}
" Colors {{{1

" Custom Highlighting {{{

augroup SpellColors
  autocmd!
  autocmd ColorScheme * highlight SpellBad   ctermfg=red  guifg=#E06C75
  autocmd ColorScheme * highlight SpellLocal ctermfg=none guifg=none
  autocmd ColorScheme * highlight SpellRare  ctermfg=none guifg=none
  autocmd ColorScheme * highlight SpellCap   ctermfg=none guifg=none
augroup end

augroup CocColors
  autocmd!
  autocmd ColorScheme * highlight CocWarningFloat ctermfg=yellow guifg=#E5C07B
  autocmd ColorScheme * highlight CocWarningSign  ctermfg=yellow guifg=#E5C07B
  autocmd ColorScheme * highlight CocErrorFloat   ctermfg=red    guifg=#E06C75
  autocmd ColorScheme * highlight CocErrorSign    ctermfg=red    guifg=#E06C75

  autocmd ColorScheme * highlight CocInfoHighlight    ctermfg=none guifg=none cterm=none gui=none
  autocmd ColorScheme * highlight CocWarningHighlight ctermfg=none guifg=none cterm=none gui=none
  autocmd ColorScheme * highlight CocErrorHighlight   ctermfg=none guifg=none cterm=none gui=none
augroup end

augroup StartifyColors
  autocmd!
  autocmd ColorScheme * highlight StartifyFile ctermfg=blue guifg=#61AFEF
  autocmd ColorScheme * highlight StartifyPath ctermfg=grey guifg=#ABB2BF
augroup end

augroup GitGutterColors
  autocmd!
  autocmd ColorScheme * highlight GitGutterAdd    ctermfg=grey guifg=#5C6370
  autocmd ColorScheme * highlight GitGutterChange ctermfg=grey guifg=#5C6370
  autocmd ColorScheme * highlight GitGutterDelete ctermfg=grey guifg=#5C6370
augroup end

augroup MiscColors
  autocmd!
  autocmd ColorScheme * highlight MatchParen cterm=bold gui=bold ctermfg=blue guifg=#61AFEF
  autocmd ColorScheme * highlight Cursor ctermfg=white guibg=#ABB2BF
  autocmd ColorScheme * highlight pythonExtraOperator ctermfg=red guifg=#E06C75
  autocmd ColorScheme * highlight doxygenBOther ctermfg=grey guifg=#5C6370

  " too much
  autocmd ColorScheme * highlight link JavaIdentifier NONE

  " autocmd ColorScheme * highlight Comment cterm=italic gui=italic
  " autocmd ColorScheme * highlight jsFuncArgs cterm=italic gui=italic
  " autocmd ColorScheme * highlight pythonParameters cterm=italic gui=italic
augroup end

augroup CColors
  autocmd!
  autocmd ColorScheme * highlight cIncluded  ctermfg=yellow guifg=#E5C07B
  autocmd ColorScheme * highlight cBraces    ctermfg=yellow guifg=#E5C07B
  autocmd ColorScheme * highlight cDelimiter ctermfg=yellow guifg=#E5C07B

  autocmd ColorScheme * highlight cCustomStruct     ctermfg=blue guifg=#61AFEF
  autocmd ColorScheme * highlight cCustomStructName ctermfg=blue guifg=#61AFEF
  autocmd ColorScheme * highlight cCustomClass      ctermfg=blue guifg=#61AFEF
  autocmd ColorScheme * highlight cCustomClassName  ctermfg=blue guifg=#61AFEF
  autocmd ColorScheme * highlight cppStructure      ctermfg=blue guifg=#61AFEF

  autocmd ColorScheme * highlight cType           ctermfg=cyan guifg=#56B6C2
  autocmd ColorScheme * highlight cStructure      ctermfg=cyan guifg=#56B6C2
  autocmd ColorScheme * highlight cCustomClassKey ctermfg=cyan guifg=#56B6C2
  autocmd ColorScheme * highlight cppBoolean      ctermfg=cyan guifg=#56B6C2
  autocmd ColorScheme * highlight cppType         ctermfg=cyan guifg=#56B6C2
  autocmd ColorScheme * highlight cppSTLtype      ctermfg=cyan guifg=#56B6C2

  autocmd ColorScheme * highlight cOperator        ctermfg=red guifg=#E06C75
  autocmd ColorScheme * highlight cCustomScope     ctermfg=red guifg=#E06C75
  autocmd ColorScheme * highlight cStorageClass    ctermfg=red guifg=#E06C75
  autocmd ColorScheme * highlight cCustomAccessKey ctermfg=red guifg=#E06C75

  autocmd ColorScheme * highlight cCustomFunc    ctermfg=green guifg=#98C379
  autocmd ColorScheme * highlight cUserFunction  ctermfg=green guifg=#98C379
  autocmd ColorScheme * highlight cppSTLfunction ctermfg=green guifg=#98C379

  autocmd ColorScheme * highlight cUserLabel ctermfg=white guifg=#ABB2BF

  autocmd ColorScheme * highlight cDelimiter ctermfg=none guifg=none
  autocmd ColorScheme * highlight cBraces ctermfg=none guifg=none
augroup end

augroup MarkdownColors
  autocmd!
  autocmd ColorScheme * highlight htmlBoldItalic ctermfg=magenta guifg=#C678DD cterm=bold,italic gui=bold,italic
  autocmd ColorScheme * highlight htmlItalic     ctermfg=yellow  guifg=#E5C07B cterm=italic      gui=italic
  autocmd ColorScheme * highlight htmlBold       ctermfg=magenta guifg=#C678DD cterm=bold        gui=bold
  autocmd ColorScheme * highlight htmlH1         ctermfg=blue    guifg=#61AFEF cterm=bold        gui=bold
  autocmd ColorScheme * highlight htmlH2         ctermfg=blue    guifg=#61AFEF cterm=bold        gui=bold
  autocmd ColorScheme * highlight htmlH3         ctermfg=blue    guifg=#61AFEF cterm=bold        gui=bold
  autocmd ColorScheme * highlight htmlH4         ctermfg=blue    guifg=#61AFEF cterm=bold        gui=bold
  autocmd ColorScheme * highlight mkdLink        ctermfg=blue    guifg=#61AFEF
  autocmd ColorScheme * highlight mkdHeading     ctermfg=none    guifg=#FFFFFF
augroup end

" custom .todo filetype
augroup TodoColors
  autocmd!
  autocmd ColorScheme * highlight def link todoDone Comment
  autocmd ColorScheme * highlight def link todoFolds Comment
  autocmd ColorScheme * highlight todoHeading  ctermfg=blue   guifg=#61AFEF cterm=bold   gui=bold
  autocmd ColorScheme * highlight todoDates    ctermfg=yellow guifg=#E5C07B cterm=italic gui=italic
  autocmd ColorScheme * highlight todoTag      ctermfg=red    guifg=#E06C75
  autocmd ColorScheme * highlight todoProgress ctermfg=yellow
  autocmd ColorScheme * highlight todoHigh     ctermfg=red    guifg=#E06C75 cterm=bold   gui=bold
  autocmd ColorScheme * highlight todoMed      ctermfg=cyan   guifg=#56B6C2
  autocmd ColorScheme * highlight todoLow      ctermfg=green  guifg=#98C379
augroup end

" }}}

set t_Co=256
set background=dark
syntax on
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
colorscheme custom_onedark

" }}}
" General Settings {{{1

" autochdir alternative for Dirvish
autocmd! BufEnter * silent! lcd %:p:h

" sessions
let g:session_dir = '~/vimfiles/sessions'

filetype plugin indent on
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set wildignore=*~,*.DAT,ntuser*,NTUSER*,_.sw*,*.json,node_modules/

" misc
set timeoutlen=500
set lazyredraw
set autoread
set nobackup
set noswapfile
" set makeprg=make\ %<

" numbers and lines
set relativenumber
set number
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
set formatoptions-=o " no auto insert comments on o/O
set formatoptions-=r " no auto insert comments on CR

" folding options
set foldlevelstart=0
set foldtext=GetFoldText() " custom fold text

" fix autofold lag after completion
augroup FixFolds
  autocmd!
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  " autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup end

" }}}
" Filetype Settings {{{1

augroup Misc
  autocmd!
  autocmd BufWritePre * call <SID>StripWhitespace()
  autocmd FileType * set formatoptions-=o "ugh
augroup end

augroup Help
  autocmd!
  autocmd FileType help setlocal nomodeline
augroup end

augroup QuickFix
    autocmd!
    " auto open quickfix
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup end

augroup Vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup end

augroup Startify
  autocmd!
  autocmd FileType startify setlocal nowrap
augroup end

augroup Python
    autocmd!
    autocmd FileType python " highlight self
          \ syn keyword pythonSelf self
          \ | highlight def link pythonSelf pythonInclude
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal nofoldenable
augroup end

" language highlighting options
let c_no_curly_error = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

augroup CStyle
  autocmd!
  autocmd FileType c,cpp setlocal cinoptions+=L0 " fix :: indent in C

  autocmd FileType c,cpp ClangFormatAutoEnable
  autocmd FileType c,cpp,javascript setlocal nofoldenable

  " auto expand /* */ comments
  autocmd FileType c,cpp,java,javascript inoremap /* /*<Tab>*/<C-g>U<Left><C-g>U<Left><C-g>U<Left>

  autocmd FileType c,cpp,java,javascript,typescript setlocal commentstring=//\ %s
  " autocmd FileType c,cpp,javascript setlocal commentstring=/*\ %s\ */
augroup end

augroup Markdown
  autocmd!
  autocmd BufReadPost,BufNewFile *.md,*.markdown set filetype=markdown

  " compile to pdf
  " autocmd FileType markdown nnoremap <buffer> <C-s>
  "       \ :Make %:t:r.pdf<CR>
  autocmd FileType markdown nnoremap <buffer> <C-s>
        \ :Dispatch md2pdf.sh %:p -wsl<CR>

  " open pdf viewer
  " autocmd FileType markdown,pdf nnoremap <buffer> <leader>v
  "       \ :Make view-%:t:r<CR>
  autocmd FileType markdown,pdf nnoremap <buffer> <leader>v
        \ :Dispatch $PSHELL -Command SumatraPDF -reuse-instance %:t:r.pdf<CR>
        " \ :Dispatch cmd.exe /c start /b SumatraPDF -reuse-instance %:t:r.pdf<CR>

  " autoexpand math in Pandoc
  autocmd FileType markdown inoremap <buffer> $ $$<C-g>U<Left>
  autocmd FileType markdown inoremap <buffer> <M-$> $

  " table mode
  autocmd FileType markdown inoremap <buffer> <C-b> <C-o>:TableModeToggle<CR>

  " auto spellcheck, columns
  " autocmd FileType markdown setlocal spell spelllang=en_us
  " autocmd FileType markdown setlocal textwidth=80
augroup end

augroup Text
  autocmd!
    " table mode
    autocmd FileType text inoremap <buffer> <C-b> <C-o>:TableModeToggle<CR>

    " auto spellcheck, columns
    " autocmd FileType text setlocal spell spelllang=en_us
    autocmd FileType text setlocal textwidth=80
    autocmd FileType text setlocal colorcolumn=80

    " quick format to textwidth
    autocmd FileType text nmap <buffer> <Tab> mz{gq}`z
    " autocmd FileType text imap <buffer> <C-S-CR> <CR><CR><C-o>gq{
augroup end

" custom todo filetype
augroup Todo
  autocmd!
  autocmd BufRead *.todo set filetype=todo

  autocmd FileType todo setlocal noautoindent
  autocmd FileType todo setlocal foldmethod=marker " fold completed tasks

  " uncomment to delete completed tasks
  " autocmd FileType todo nmap <buffer> <silent> <C-s>
  "       \ :g/\[x\]/d<CR>

  " shift indentation, and move completed tasks to end
  autocmd FileType todo nmap <buffer> <silent> <C-s>
        \ ma
        \ :%s:\v.*(\[x\]):\1:e<CR>
        \ :g:\[x\]:m$<CR>
        \ gg`a

  " check completed tasks
  autocmd FileType todo nmap <buffer> <CR> :call checkbox#ToggleCB()<CR>

  " auto start lines with [ ] or -
  autocmd FileType todo inoremap <buffer> <CR> <CR>[ ]<Tab>
  autocmd FileType todo inoremap <buffer> <S-CR> <CR><Tab>-<Tab>
  autocmd FileType todo nnoremap <buffer> o o[ ]<Tab>
  autocmd FileType todo nnoremap <buffer> <S-o> o<Tab>-<Tab>
  autocmd FileType todo nnoremap <buffer> <C-o> o

  " syntax matching
  autocmd FileType todo syntax match todoHeading "^[A-Z][^{]*"
  autocmd FileType todo syntax match todoTag "\v\+(\w|-)*"
  " autocmd FileType todo syntax match todoDates "\v((\[.])=|\-)\zs.{-}\ze\s*\|"
  autocmd FileType todo syntax match todoDates "\v(-|\[.])\zs[^\[\]]{-}\ze\s*\|"
  autocmd FileType todo syntax match todoProgress contains=todoDates ".*\[\-\].*"
  autocmd FileType todo syntax match todoDone ".*\[x\].*"
  autocmd FileType todo syntax match todoHigh "\v\(A\)"
  autocmd FileType todo syntax match todoMed "\v\(B\)"
  autocmd FileType todo syntax match todoLow "\v\(C\)"
  " autocmd FileType todo syntax match todoCheckbox "\[\ \]" conceal cchar=
  " autocmd FileType todo syntax match todoCheckbox "\[x\]" conceal cchar=✅

  " hide folds
  autocmd FileType todo syntax match todoFolds "{{{.*" conceal
  autocmd FileType todo syntax match todoFolds "}}}" conceal
augroup end

" }}}
" Plugin Settings {{{1

" Checkbox
let g:checkbox_states = [' ', 'x']

" Clang Format
let g:clang_format#style_options = {
 \ "BinPackParameters" : "true",
 \ "AlignAfterOpenBracket" : "true",
 \ "AlignOperands" : "true",
 \ "SortIncludes" : "false",
 \ "ConstructorInitializerIndentWidth" : 2,
 \ "Standard" : "Cpp11",
 \ "BasedOnStyle" : "Chromium",
 \ "AlignTrailingComments" : "true",
 \ "ColumnLimit" : 0,
 \ "SpacesBeforeTrailingComments" : 1,
 \ "BreakBeforeBraces" : "Allman",
 \ "AllowShortFunctionsOnASingleLine" : "All",
 \ "AlignConsecutiveAssignments" : "true",
 \ "ReflowComments" : "true" }

" Dirvish
" sort directories first
" let g:dirvish_mode = ':sort | sort ,^.*[^\\]$, r | silent keeppatterns g/\vnode_modules|\\\.[^\\]+/d _'
let g:dirvish_mode = ':sort ,^.*/,'

" FZF
" use rg for faster searching
let $FZF_DEFAULT_COMMAND = 'rg --files'
" full window fzf preview
let g:fzf_layout = { 'window': '-tabnew' }
" custom Files command with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat -p --color always {}']}, <bang>0)
" hide status in fzf preview
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler norelativenumber
  \ | autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler relativenumber

" Lightline
let g:lightline = { 'colorscheme': 'onedark' }
let g:lightline.component = {
      \'time': "%{strftime('%I.%M')}" }
let g:lightline.component_function = {
      \ 'cocstatus': 'coc#status',
      \ 'gitbranch': 'fugitive#head'
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers',
      \  'cocErrors': 'GetCocErrors',
      \  'cocWarnings': 'GetCocWarnings',
      \  'cocOK': 'GetCocOK'
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'buffers': 'tabsel',
      \     'cocErrors': 'error',
      \     'cocWarnings': 'warning',
      \     'cocOK': 'left'
      \ }
" detailed statusline
" let g:lightline.active = { 'right': [ ['lineinfo'], ['percent'],
"       \                               ['cocErrors', 'cocWarnings', 'cocOK'],
"       \                               ['fileformat', 'fileencoding', 'filetype', 'time'] ],
"       \                    'left': [ ['mode', 'paste'],
"       \                              ['gitbranch', 'readonly', 'filename', 'modified'] ] }
" minimal statusline
let g:lightline.active = {
      \  'right': [ ['percent'], ['filetype'] ],
      \  'left':  [ ['mode', 'paste'],
      \             ['readonly', 'filename', 'modified'] ] }
" update lightline on diagnostic change
autocmd User CocDiagnosticChange call lightline#update()
" show bufferline at top
set showtabline=2
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline#bufferline#filename_modifier = ':t'

" Goyo and Limelight
let g:goyo_width = '95%'
let g:goyo_height = '95%'
let g:goyo_linenr = 1
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" Gitgutter
let g:gitgutter_sign_added = '\ +'
let g:gitgutter_sign_modified = '\ ~'
let g:gitgutter_sign_removed = '\ -'

" Vim Markdown
let g:markdown_folding = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['c++=cpp', 'py=python', 'js=javascript', 'java']

" Startify
let g:startify_enable_special = 0
let g:startify_use_env = 1
let g:startify_change_to_dir = 0
let g:startify_padding_left = 3
let g:startify_session_dir = session_dir
let g:startify_lists = [ { 'type': 'files' }, { 'type': 'sessions' }, { 'type': 'bookmarks' } ]
let g:startify_bookmarks = [
      \{'c': '$MYVIMRC'},
      \{'l': '$DOCUMENTS/wiki/my_lists.md'},
      \{'t': '$DOCUMENTS/wiki/tasks.todo'},
      \{'w': '$DOCUMENTS/wiki/README.md'} ]
let g:startify_custom_header = [
          \ ' ',
          \ '                                             ',
          \ '                         __                  ',
          \ '                 __  __ /\_\    ___ ___      ',
          \ '                /\ \/\ \\/\ \ /   __  __\   ',
          \ '                \ \ \_/ |\ \ \/\ \/\ \/\ \   ',
          \ '                 \ \___/  \ \_\ \_\ \_\ \_\  ',
          \ '                  \/__/    \/_/\/_/\/_/\/_/  ',
          \ ' ',
          \ ]

" UltiSnips
let g:UltiSnipsSnippetDirectories = ['~/dotfiles/.config/ultisnips']
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:ulti_expand_or_jump_res = 0

" Vista tags
let g:vista_fzf_preview = ['right:10%']
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_echo_cursor = 0

" }}}
" Functions {{{1

" start jobs in nvim
command! -nargs=1 -complete=file
      \ StartAsync call jobstart(expand(<f-args>))
command! -nargs=1 -complete=file
      \ StartAsyncLog call jobstart(expand(<f-args>), {
      \ 'on_exit': { j,d,e ->
      \ execute('echo "command finished with status '.d.'"', '')}})

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

" global functions

" functions for getting number of Coc diagnostics
function! GetCocWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction

function! GetCocErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  return join(msgs, ' ')
endfunction

function! GetCocOK() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return 'OK' | endif
  return ''
endfunction

" print stack of matching syntax rules
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" toggle fullscreen in nvim-qt or gVim
function! ToggleFullscreen()
  if &l:columns ># 110
    call GuiWindowFullScreen(0)
    set lines=25 columns=85
  else
    call GuiWindowFullScreen(1)
  endif
endfunction

" custom fold text with depth
function! GetFoldText()
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
  return repeat('▧', v:foldlevel) . repeat(' ', indent) . text . ' '
endfunction

" }}}

" Mappings {{{1

let mapleader = ";"

" swap ; and , to use ; as leader
nnoremap , ;
nnoremap ;, ,

" quick repeat last macro
nnoremap Q @@
" yank consistency
nnoremap Y y$

" Editing {{{

" colonize (TODO: fix functionality in terminal vim)
inoremap <S-CR> <C-o>A;
inoremap <C-CR> <C-o>A;<CR>

" cgn current word
nnoremap <silent> c<Tab> :let @/=expand('<cword>')<CR>cgn

" quick substitution
nnoremap gs :s:::g<Left><Left><Left>
nnoremap gS :%s:::gc<Left><Left><Left><Left>

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
" Movement {{{

" mimic vinegar
nnoremap <silent> - :Dirvish<CR>

" previous buffer
nnoremap <BS> :e#<CR>

" wrap j, k, and $
nmap j gj
nmap k gk
nmap $ g$

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

" CamelCase motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" uncomment for M-hjkl as alternate arrows in gVim
" noremap ë <Up>
" noremap ê <Down>
" noremap è <Left>
" noremap ì <Right>
" inoremap ë <Up>
" inoremap ê <Down>
" inoremap è <Left>
" inoremap ì <Right>
" cnoremap ë <Up>
" cnoremap ê <Down>
" cnoremap è <Left>
" cnoremap ì <Right>

" uncomment for M-hjkl as alternate arrows in terminal vim
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
" Leader Mappings {{{

noremap <silent> <leader>s :Startify<CR>
noremap <silent> <leader>rc :edit $MYVIMRC<CR>
noremap <silent> <leader>cc :CocConfig<CR>
noremap <leader>so :source $MYVIMRC<CR>

noremap <silent> <leader>e :Files $DOCUMENTS<CR>
noremap <silent> <leader>f :Files .<CR>
noremap <silent> <leader>o <C-w>o
noremap <silent> <leader>w :w!<CR>
noremap <silent> <leader>c :close<CR>
noremap <silent> <leader>cl :cclose<CR>
noremap <silent> <leader>q :qa<CR>

" buffers
noremap <silent> <leader>; :Buffers<CR>
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

" plugins
noremap <silent> <leader>g :Goyo<CR>
noremap <silent> <leader>t :Vista<CR>

" browse Coc errors
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

" }}}
" Other {{{

" vertical help
cabbrev vh vert help

" bash command from windows
cabbrev !b !bash -c " "<Left><Left>

" quick save session
execute 'nnoremap <leader>ss :mks! ' . g:session_dir . '/*.vim<C-d><Left><Left><Left><Left><BS>'

" toggle fullscreen
noremap <leader>r :call ToggleFullscreen()<CR>

" check syntax highlight
nnoremap <leader>sy :call SynStack()<CR>

" quick make
nmap <C-s> :Make<CR>
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
" Coc Mappings {{{1

" <CR> always newline, only expand with <C-y>
inoremap <silent><expr> <CR> "\<C-g>u\<CR>"

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" }}}
