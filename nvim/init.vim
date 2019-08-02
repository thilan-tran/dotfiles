" My Vim Config {{{

" gVim / NeoVim {{{2

  if (has('gui_running'))
    set guifont=Iosevka:h20
    set renderoptions=type:directx " ligatures
    set guioptions-=m  " hide menu bar
    set guioptions-=T  " hide toolbar
    set guioptions-=r  " hide scrollbar
  endif

  " fullscreen GUI on startup
  augroup Startup
    autocmd!
    autocmd GUIEnter * simalt ~x
    autocmd GUIEnter * WToggleClean
    autocmd GUIEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
    " autocmd VIMEnter * :Goyo
  augroup END

  set rtp+=~/.config/nvim/

" }}}
" Plugged {{{2

  call plug#begin('~/vimfiles/plugged')

  " colors
  Plug 'chriskempson/base16-vim'
  Plug 'joshdick/onedark.vim'

  " syntax highlighting
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'justinmk/vim-syntax-extra'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'kh3phr3n/python-syntax'

  " modeline and startup
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'mhinz/vim-startify'

  " goyo
  Plug 'junegunn/goyo.vim'
  " Plug 'junegunn/limelight.vim'

  " markdown
  Plug 'plasticboy/vim-markdown'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'jkramer/vim-checkbox'

  " autocompletion
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
  Plug 'sirver/ultisnips'
  Plug 'rhysd/vim-clang-format'

  " Plug 'ajh17/VimCompletesMe'
  " Plug 'Valloric/YouCompleteMe'
  " Plug 'w0rp/ale'
  " Plug 'maximbaz/lightline-ale'

  " FZF and tags
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'liuchengxu/vista.vim'

  " directory browser
  Plug 'justinmk/vim-dirvish'
  " Plug 'd86leader/vim-netrwild'
  " Plug 'tpope/vim-vinegar'
  " Plug 'tpope/vim-eunuch'

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " other utilities
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'bkad/CamelCaseMotion'
  Plug 'kkoenig/wimproved.vim'

call plug#end()

" }}}
" Colors {{{2

" Custom Highlighting {{{

  augroup my-highlighting
    autocmd!
    " misc
    autocmd ColorScheme * highlight Comment cterm=italic gui=italic
    autocmd ColorScheme * highlight MatchParen cterm=bold gui=bold
    autocmd ColorScheme * highlight SpellLocal ctermfg=none guifg=none
    autocmd ColorScheme * highlight SpellRare ctermfg=none guifg=none
    autocmd ColorScheme * highlight SpellCap ctermfg=none guifg=none
    " yellow
    autocmd ColorScheme * highlight cIncluded ctermfg=yellow guifg=#E5C07B
    autocmd ColorScheme * highlight cBraces ctermfg=yellow guifg=#E5C07B
    autocmd ColorScheme * highlight cDelimiter ctermfg=yellow guifg=#E5C07B
    autocmd ColorScheme * highlight TagbarHighlight ctermfg=yellow guifg=#E5C07B
    autocmd ColorScheme * highlight CocWarningFloat ctermfg=yellow guifg=#E5C07B
    autocmd ColorScheme * highlight CocWarningSign ctermfg=yellow guifg=#E5C07B
    autocmd ColorScheme * highlight CocWarningHighlight cterm=none ctermfg=none gui=none guifg=none
    " blue
    autocmd ColorScheme * highlight cppStructure ctermfg=blue guifg=#61AFEF
    autocmd ColorScheme * highlight cCustomClassName ctermfg=blue guifg=#61AFEF
    autocmd ColorScheme * highlight cCustomStructName ctermfg=blue guifg=#61AFEF
    autocmd ColorScheme * highlight cCustomStruct ctermfg=blue guifg=#61AFEF
    autocmd ColorScheme * highlight cCustomClass ctermfg=blue guifg=#61AFEF
    autocmd ColorScheme * highlight StartifyFile ctermfg=blue guifg=#61AFEF
    " white
    autocmd ColorScheme * highlight Cursor ctermfg=white guibg=#ABB2BF
    autocmd ColorScheme * highlight cUserLabel ctermfg=white guifg=#ABB2BF
    autocmd ColorScheme * highlight TagbarPseudoID ctermfg=white guifg=#ABB2BF
    autocmd ColorScheme * highlight StartifyPath ctermfg=grey guifg=#ABB2BF
    " cyan
    autocmd ColorScheme * highlight cppType ctermfg=cyan guifg=#56B6C2
    autocmd ColorScheme * highlight cppSTLtype ctermfg=cyan guifg=#56B6C2
    autocmd ColorScheme * highlight cType ctermfg=cyan guifg=#56B6C2
    autocmd ColorScheme * highlight cppBoolean ctermfg=cyan guifg=#56B6C2
    autocmd ColorScheme * highlight cCustomClassKey ctermfg=cyan guifg=#56B6C2
    autocmd ColorScheme * highlight cStructure ctermfg=cyan guifg=#56B6C2
    " red
    autocmd ColorScheme * highlight cCustomScope ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight cOperator ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight cStorageClass ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight cCustomAccessKey ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight TagbarAccessPrivate ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight TagbarVisibilityPrivate ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight pythonExtraOperator ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight CocErrorFloat ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight CocErrorSign ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight SpellBad ctermfg=red guifg=#E06C75
    autocmd ColorScheme * highlight CocErrorHighlight cterm=none ctermfg=none gui=none guifg=none
    " green
    autocmd ColorScheme * highlight cCustomFunc ctermfg=green guifg=#98C379
    autocmd ColorScheme * highlight cUserFunction ctermfg=green guifg=#98C379
    autocmd ColorScheme * highlight cppSTLfunction ctermfg=green guifg=#98C379
    autocmd ColorScheme * highlight TagbarAccessPublic ctermfg=green guifg=#98C379
    autocmd ColorScheme * highlight TagbarVisibilityPublic ctermfg=green guifg=#98C379
    " grey
    autocmd ColorScheme * highlight doxygenBOther ctermfg=grey guifg=#5C6370
    autocmd ColorScheme * highlight GitGutterAdd ctermfg=grey guifg=#5C6370
    autocmd ColorScheme * highlight GitGutterChange ctermfg=grey guifg=#5C6370
    autocmd ColorScheme * highlight GitGutterDelete ctermfg=grey guifg=#5C6370
    " reset
    autocmd ColorScheme * highlight cDelimiter ctermfg=none guifg=none
    autocmd ColorScheme * highlight cBraces ctermfg=none guifg=none

    " markdown
    autocmd ColorScheme * highlight htmlItalic cterm=italic ctermfg=yellow gui=italic guifg=#E5C07B
    autocmd ColorScheme * highlight htmlBold cterm=bold ctermfg=magenta gui=bold guifg=#C678DD
    autocmd ColorScheme * highlight htmlH1 cterm=bold ctermfg=blue gui=bold guifg=#61AFEF

    " todo
    autocmd ColorScheme * :hi todoTag ctermfg=red guifg=#E06C75
    autocmd ColorScheme * :hi todoHigh cterm=bold ctermfg=red gui=bold guifg=#E06C75
    autocmd ColorScheme * :hi todoNotes cterm=bold ctermfg=red gui=bold guifg=#E06C75
    autocmd ColorScheme * :hi todoDates cterm=italic ctermfg=yellow gui=italic guifg=#E5C07B
    autocmd ColorScheme * :hi todoHeading cterm=bold ctermfg=blue gui=bold guifg=#61AFEF
    autocmd ColorScheme * :hi todoMed ctermfg=cyan guifg=#56B6C2
    autocmd ColorScheme * :hi todoLow ctermfg=green guifg=#98C379
    autocmd ColorScheme * :hi def link todoDone Comment
    " autocmd ColorScheme * :hi todoBrackets cterm=bold ctermfg=green gui=bold guifg=#98C379

  augroup end

" }}}

  set t_Co=16
  highlight Normal ctermbg=none
  highlight nonText ctermbg=none
  if (has("termguicolors"))
    set termguicolors
  endif

  syntax on
  set background=dark
  colorscheme onedark

" }}}
" Vim Settings {{{2

  " Folding {{{

    set foldlevelstart=1
    set foldtext=MyFoldText()

    " fix auto fold after completion
    augroup Fix-Folds
      autocmd!
      autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
      " autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    augroup END

  " }}}

  runtime macros/matchit.vim

  set number
  set cursorline
  set ruler
  set signcolumn=yes

  set noshowmode
  set laststatus=2
  set shortmess=Fat
  set autoread
  set timeoutlen=400
  set scrolloff=2

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
  set nohlsearch

  set wildcharm=<Tab>
  set wildmenu

  set lazyredraw
  " set showmatch
  set backspace=indent,eol,start
  set hidden

  set splitbelow
  set splitright

  set conceallevel=2
  set concealcursor=nv

  filetype plugin indent on
  set encoding=utf-8
  set ff=unix
  set fileformats=unix,dos
  set wildignore=*~,*.DAT,ntuser*,NTUSER*,_.sw*,*.json,node_modules/

  " completion popup
  set pumheight=7
  set complete-=i
  set complete-=t
  set completeopt=menuone,noselect
  set shortmess+=c

  " format options
  set fo+=t
  set fo-=l
  set fo-=o

  " render whitespace
  " set listchars=eol:·,tab:>·,trail:~,extends:>,precedes:<,space:·
  " set list

  let g:session_dir = 'C:\Users\qwert\vimfiles\session'

  " autochdir alternative
  autocmd BufEnter * silent! lcd %:p:h

" }}}
" Filetype Settings {{{2

  augroup secure_modeline_conflict_workaround
    autocmd!
    autocmd FileType help setlocal nomodeline
  augroup END

  " c, cpp, python, javascript
  "fix :: indent in c
  augroup Coding
    autocmd!
    autocmd FileType c,cpp setlocal cinoptions+=L0
    autocmd FileType c,cpp ClangFormatAutoEnable
    autocmd FileType c,cpp,python,javascript setlocal nofoldenable
    autocmd FileType c,cpp,python,javascript setlocal signcolumn=yes
    autocmd FileType javascript setlocal commentstring=/*\ %s\ */
  augroup END

  " language highlighting options
  let c_no_curly_error = 1
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let python_self_cls_highlight = 1

  augroup Editing
    autocmd!
    autocmd BufReadPost,BufNewFile *.md,*.markdown set filetype=markdown

    " auto spellcheck, columns
    " autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    " autocmd BufRead,BufNewFile *.md setlocal textwidth=80
    " autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.txt setlocal textwidth=80
    autocmd BufRead,BufNewFile *.txt setlocal colorcolumn=80

    " table mode
    autocmd FileType markdown inoremap <buffer> <C-b> <C-o>:TableModeToggle<CR>
    autocmd FileType text inoremap <buffer> <C-b> <C-o>:TableModeToggle<CR>

    " change header level
    " autocmd FileType markdown nmap <buffer> <tab> mz]cI#<esc>`z
    " autocmd FileType markdown nmap <buffer> <S-tab> mz]c0x`z

    " quick format
    " autocmd FileType text nmap <buffer> <tab> mz{gq}`z

    " quick indent
    " autocmd FileType text nnoremap <buffer> <tab> >>
    " autocmd FileType text nnoremap <buffer> <S-tab> <<
    " autocmd FileType text xnoremap <buffer> <tab> >gv
    " autocmd FileType text xnoremap <buffer> <S-tab> <gv

    " quick format
    autocmd FileType text imap <buffer> <C-S-CR> <CR><CR><C-o>gq{

    " fold vim by marker
    autocmd FileType vim setlocal foldmethod=marker

    " no autocomments on o or O
    autocmd FileType * set formatoptions-=o

    autocmd BufWritePre * call StripWhitespace()
  augroup END

  " todo / tasks
  augroup Todo
    autocmd!

    " sort by tag
    autocmd BufRead *.todo nmap <buffer> <silent> <C-s>
          \ mz
          \ :exe search('ASSIGNMENTS').','.(search('\v^$')-1).'sort /\v[^+]*\+/'<CR>
          \ `z

    " auto start lines with [ ] or -
    autocmd BufRead *.todo inoremap <buffer> <CR> <CR>[ ]<TAB>
    autocmd BufRead *.todo inoremap <buffer> <S-CR> <CR><TAB>-<TAB>

    autocmd BufRead *.todo nnoremap <buffer> o o[ ]<TAB>
    autocmd BufRead *.todo nnoremap <buffer> <S-o> o<TAB>-<TAB>
    autocmd BufRead *.todo nnoremap <buffer> <C-o> o


    " clear completed
    autocmd BufRead *.todo nmap <buffer> <CR> :call checkbox#ToggleCB()<CR>
    autocmd BufRead *.todo nmap <buffer> <S-CR> :g/\V[x]/m$<CR>

    autocmd BufRead *.todo :NoMatchParen
    autocmd BufRead *.todo :set noautoindent
    autocmd BufRead *.todo :set fdm=marker

    autocmd BufRead *.todo :syn match todoHeading "^[A-Z].*"
    autocmd BufRead *.todo :syn match todoTag "\v\+\w*"
    autocmd BufRead *.todo :syn match todoDates "\v\] \zs.*\ze \|"
    autocmd BufRead *.todo :syn match todoNotes "\v^\s*\-"
    autocmd BufRead *.todo :syn match todoBrackets "\V\^[ ]"
    autocmd BufRead *.todo :syn match todoDone ".*\[x\].*"
    autocmd BufRead *.todo :syn match todoHigh "\v\(A\)"
    autocmd BufRead *.todo :syn match todoMed "\v\(B\)"
    autocmd BufRead *.todo :syn match todoLow "\v\(C\)"
  augroup end

" }}}
" Plugin Settings {{{2

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

" let g:dirvish_mode = ':sort | sort ,^.*[^\\]$, r | silent keeppatterns g/\vnode_modules|\\\.[^\\]+/d _'
let g:dirvish_mode = ':sort | sort /^.*[^\\]$/ r'

" let g:fzf_layout = { 'left': '~30%' }
let g:fzf_layout = { 'window': '-tabnew' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore-dir EAGLE --ignore-dir Libraries --ignore-dir E96C --ignore node_modules*'
let $FZF_DEFAULT_COMMAND = 'rg --files'

let g:lightline = { 'colorscheme': 'onedark' }
let g:lightline.component = {
      \  'time': "%{strftime('%I.%M')}" }
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
      \  'right': [ ['cocErrors', 'cocWarnings', 'cocOK'], ['filetype', 'percent'] ],
      \  'left':  [ ['mode', 'paste'],
      \             ['readonly', 'filename', 'modified'] ] }
autocmd User CocDiagnosticChange call lightline#update()

" bufferline
set showtabline=2
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline#bufferline#filename_modifier = ':t'

let g:goyo_width = '95%'
let g:goyo_height = '95%'
let g:goyo_linenr = 1
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

let g:gitgutter_sign_added = '\ +'
let g:gitgutter_sign_modified = '\ ~'
let g:gitgutter_sign_removed = '\ -'

" let g:vim_markdown_conceal = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:markdown_folding = 1
let g:vim_markdown_fenced_languages = ['c++=cpp', 'py=python', 'js=javascript']

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner = 0
" let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 75
let g:netrw_wiw = 20
let g:netrw_usetab = 1
let g:netrw_special_syntax = 0

let g:nuake_position = 'bottom'
let g:nuake_size = 0.35

let g:startify_enable_special = 0
" let g:startify_use_env = 1
let g:startify_relative_path = 1
let g:startify_change_to_dir = 0
let g:startify_padding_left = 3
let g:startify_session_dir = 'C:\Users\qwert\vimfiles\session'
let g:startify_lists = [ { 'type': 'files' }, { 'type': 'sessions' }, { 'type': 'bookmarks' } ]
let g:startify_bookmarks = [ {'c': '~\AppData\Local\nvim\init.vim'}, {'w': '~\OneDrive\Documents\Wiki\index.md'}, {'t': '~\OneDrive\Documents\Wiki\tasks.todo'} ]
let g:startify_custom_header = [
          \ ' ',
          \ '                                             ',
          \ '                         __                  ',
          \ '                 __  __ /\_\    ___ ___      ',
          \ '                /\ \/\ \\/\ \ /'' __` __`\   ',
          \ '                \ \ \_/ |\ \ \/\ \/\ \/\ \   ',
          \ '                 \ \___/  \ \_\ \_\ \_\ \_\  ',
          \ '                  \/__/    \/_/\/_/\/_/\/_/  ',
          \ ' ',
          \ ]

let g:UltiSnipsSnippetDirectories = ['C:/Users/qwert/vimfiles/UltiSnips']
" let g:UltiSnipsExpandTrigger = "<C-u>"
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:ulti_expand_or_jump_res = 0

let g:vista_fzf_preview = ['right:10%']
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_echo_cursor = 0

" Deprecated {{{3

" Ale

" let g:ale_sign_column_always = 0
" let g:ale_sign_error = ' X'
" let g:ale_sign_warning = ' -'
" let g:ale_set_highlights = 1
" let g:ale_completion_enabled = 0
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
" let g:ale_linters = {
"   \'cpp': ['clang'],
"   \'python': ['flake8'],
"   \'javascript': ['jshint'] }
" let g:ale_linters_explicit = 1
" let g:ale_fixers = {
"   \'*': ['remove_trailing_lines', 'trim_whitespace'],
"   \'css': ['prettier'],
"   \'html': ['prettier'],
"   \'javascript': ['prettier'],
"   \'cpp': ['clang-format']}
" let g:ale_fix_on_save = 1
" let g:ale_c_clangformat_options = '-style="{BasedOnStyle: Chromium, ConstructorInitializerIndentWidth: 2, AllowShortFunctionsOnASingleLine: All, SpacesBeforeTrailingComments: 1, AlignTrailingComments: true, SortIncludes: false, AlignConsecutiveAssignments: true, ReflowComments: true, BinPackParameters: true, AlignAfterOpenBracket: true, AlignOperands: true, BreakBeforeBraces: Allman}"'

" lint options
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 1

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

" lightline

" let g:limelight_conceal_guifg = '#434959'
" let g:limelight_paragraph_span = 1
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

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

" youCompleteMe compatibility
" imap <expr> <right> mucomplete#extend_fwd("\<right>")
" imap <unique> <c-j> <plug>(MUcompleteCycFwd)
" imap <unique> <c-k> <plug>(MUcompleteCycBwd)
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Emmet

" let g:user_emmet_install_global = 0
" let g:user_emmet_leader_key = '<C-Z>'
" autocmd FileType html,css,markdown EmmetInstall

" Rainbow Parentheses

" augroup rainbow_c
"   autocmd!
"   autocmd FileType c,cpp,markdown RainbowParentheses
" augroup END
" let g:rainbow#max_level = 10
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" ultisnips

" <CR> for ulti snip expand
" function! Ulti_ExpandOrJump_and_getRes()
"     call UltiSnips#ExpandSnippetOrJump()
"     return g:ulti_expand_or_jump_res
" endfunction
" inoremap <silent> <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
" inoremap <silent> <expr> <plug>MyCR
"  	    \ mucomplete#ultisnips#expand_snippet("\<cr>")
" imap <cr> <plug>MyCR

" YCM

" let g:ycm_clangd_binary_path = "C:/Program Files/LLVM/bin/clangd.exe"
" let g:ycm_use_clangd = 1
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_auto_trigger = 1
" let g:ycm_filetype_blacklist = {}
" let g:ycm_min_num_indentifer_candidate_chars = 2
" let g:ycm_min_num_of_chars_for_completion = 2

" vim-wiki

" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_folding = ''
" let g:vimwiki_global_ext = 0
" autocmd FileType vimwiki set syntax=markdown | set filetype=markdown

" set window preview height to always 1
" set previewheight=1
" au BufEnter ?* call PreviewHeightWorkAround()
" func! PreviewHeightWorkAround()
"     if &previewwindow
"         exec 'setlocal winheight='.&previewheight
"     endif
" endfunc

" }}}

" }}}
" Functions {{{2

  " Coc Functions

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
             \  || getline('.')[col - 1] == '\'
  endfunction

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

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

  function! MyFoldText()
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
    " return repeat('▧', v:foldlevel) . repeat(' ', indent) . text .' ('. lines .')'
    return repeat('▧', v:foldlevel) . repeat(' ', indent) . text . ' '
  endfunction

  function! StripWhitespace()
    let save_cursor = getpos(".")
    :%s/\s\+$//e
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
  endfunction

  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunction

  function! ToggleFullscreen()
    if &l:columns ># 110
      call GuiWindowFullScreen(0)
      set lines=25 columns=85
    else
      call GuiWindowFullScreen(1)
    endif
  endfunction

" }}}

" Mappings {{{2

let mapleader = ";"
let localleader = "\\"

nnoremap <leader>so :source $MYVIMRC<CR>

" Editing {{{3

" wrap j and k
nmap j gj
nmap k gk

" colonize
inoremap <S-CR> <C-o>A;
inoremap <C-CR> <C-o>A;<CR>

" auto close
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>

inoremap ) ()
inoremap ( ()<Left>
inoremap (; ();<Left><Left>

inoremap (<CR> (<CR>)<C-c>O

inoremap ] []
inoremap [ []<Left>
inoremap [; [];<Left><Left>

inoremap {<CR> {<CR>}<C-c>O

inoremap } {}
inoremap { {}<Left>
inoremap {; {};<Left><Left>

inoremap {<CR> {<CR>}<C-c>O
inoremap {;<CR> {<CR>};<C-c>O

inoremap /* /*<Tab>*/<Left><Left><Left>

" M-bracket for single
inoremap ¨ (
inoremap © )
inoremap û {
inoremap ý }
inoremap Û [
inoremap Ý ]
inoremap <M-(> (
inoremap <M-)> )
inoremap <M-{> {
inoremap <M-}> }
inoremap <M-[> [
inoremap <M-]> ]
inoremap <M-'> '
inoremap <M-"> "
inoremap <M-`> `

" stay in the Visual mode when using shift commands
xnoremap < <gv
xnoremap > >gv

" }}}
" Movement {{{3

" recent edit
noremap <C-CR> `.
" previous buffer
nnoremap <BS> :e#<CR>

" M-hjkl for alternate arrows
noremap ë <Up>
noremap ê <Down>
noremap è <Left>
noremap ì <Right>
inoremap ë <Up>
inoremap ê <Down>
inoremap è <Left>
inoremap ì <Right>
noremap <M-k> <Up>
noremap <M-j> <Down>
noremap <M-l> <Right>
noremap <M-h> <Left>
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-l> <Right>
inoremap <M-h> <Left>

" window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Right> :vertical resize -5<CR>
nnoremap <C-Left> :vertical resize +5<CR>
nnoremap <C-Up> :res -5<CR>
nnoremap <C-Down> :res +5<CR>

" buffer movement
nnoremap <leader><tab> :bnext<CR>
nnoremap <leader><S-tab> :bprev<CR>

" CamelCase motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" }}}
" Leader Mappings {{{3

noremap <silent> <leader>s :Startify<CR>
noremap <silent> <leader>rc :vspl $MYVIMRC<CR>
noremap <silent> <leader>cc :vspl<CR> :CocConfig<CR>

noremap <silent> <leader>; :FZF ~/OneDrive/Documents<CR>
noremap <silent> <leader>e :20Vexplore<CR>

noremap <silent> <leader>w :silent w!<CR>
noremap <silent> <leader>c :close<CR>
noremap <silent> <leader>q :qa<CR>
noremap <silent> <leader>x :e!<CR>
noremap <silent> <leader>o <C-w>o

" fix ;
nnoremap , ;
nnoremap ;, ,

noremap <silent> <leader>g :Goyo<CR>
noremap <silent> <leader>t :Vista<CR>

" buffers
nnoremap <silent> <leader>bn :enew<CR> :Explore<CR>
nmap <silent> <leader>bs :split<CR><C-W><C-K>-
nmap <silent> <leader>bv :vsplit<CR><C-W><C-H>-
nnoremap <silent> <leader>bo :%bd!<CR>:e#<CR>
nnoremap <silent> <leader>bc :bd<CR>
" refresh buffer
noremap <silent> <leader>re ma:edit<CR>`azAzz
" buffer list
" noremap <silent> <leader><C-tab> :buffer<space><tab>
noremap <silent> <leader><C-tab> :Buffers<CR>

" open tags in splits
noremap <A-]> :vsplit<CR>g<C-]>
noremap <leader>] :YcmCompleter GoTo<CR>

" paste from system clipboard
noremap <leader>P "*P
noremap <leader>p "*p

" fold/unfold
" noremap <leader>u zA
" noremap <leader>f zc

" spell
noremap <silent> <leader>sp :setlocal spell! spelllang=en_us<CR>
noremap <leader>fn mz]s1z=`z
noremap <leader>fp mz[s1z=`z

" browse errors
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

" }}}
" Other {{{3

" vertical help
cabbrev vh vert help

" Bash command
cabbrev !b !bash -c " "<Left><Left>

" mimic vinegar
" nnoremap <silent> - :Explore<CR>
nnoremap <silent> - :Dirvish<CR>

" sessions
exec 'nnoremap <leader>ss :mks! ' . g:session_dir . '\*.vim<C-D><left><left><left><left><BS>'

" substitution
nnoremap gs :%s///g<Left><Left><Left>

" toggle fullscreen
noremap <leader>r :call ToggleFullscreen()<CR>

" check syntax highlight
nnoremap <leader>sy :call <SID>SynStack()<CR>

command! -nargs=1 -complete=file
  \ StartAsync call jobstart(expand(<f-args>), {
  \    'on_exit': { j,d,e ->
  \       execute('echo "command finished with status '.d.'"', '')
  \    }
  \ })

" script compilation
nnoremap <silent> <leader><space>s
  \ :vert term ++close bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -s<CR>
nnoremap <silent> <leader><space>r
  \ :vert term bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -r<CR>
nnoremap <silent> <leader><space>b
  \ :vert term bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -p<CR>
nnoremap <silent> <leader><space>p
  \ :vert term ++close bash /mnt/c/Users/qwert/OneDrive/Documents/My\ Code/Scripts/build.sh "%:p" -z<CR>

" autocompile pdf from markdown and open viewer
augroup Markdown-Compilation
  autocmd!

  autocmd FileType markdown nmap <buffer> <silent> <C-S>
    \ :echo "Compiling pdf..."<CR>
    \ :StartAsync pandoc %:p --pdf-engine=xelatex --listings -o %:p:h/%:t:r.pdf<CR>
    " \ :silent !start /b pandoc %:p --pdf-engine=xelatex --listings -o %:p:h/%:t:r.pdf<CR>

  autocmd FileType markdown,pdf nnoremap <buffer> <silent> <leader>v :silent !start /b SumatraPDF -reuse-instance %:p:h/%:t:r.pdf<CR>
augroup END

" }}}

" }}}
" Terminal {{{2

" Nuake
" nnoremap <C-a>  :Nuake<CR>
" inoremap <C-a> <C-\><C-n>:Nuake<CR>
" tnoremap <C-a> <C-\><C-n>:Nuake<CR>

noremap <silent> <leader>te
  \ :vspl<CR>
  \ :terminal bash<CR>
  \ :set nonumber<CR>
  \ :file bash<CR>i
  " \ :lcd! ~/OneDrive/Documents/My\ Code\<CR>
tnoremap <silent> <leader>s <C-\><C-n>:Startify<CR>

tnoremap <silent> <leader>[ <C-\><C-n>
tnoremap <silent> <leader>v <C-\><C-N>"*pi
tnoremap <silent> <leader>p <C-\><C-N>""pi

" replicate window movement commands
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
" tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>
tnoremap <C-Right> <C-\><C-n>:vertical resize -5<CR>
tnoremap <C-Left> <C-\><C-n>:vertical resize +5<CR>
tnoremap <C-Up> <C-\><C-n>:res -5<CR>
tnoremap <C-Down> <C-\><C-n>:res +5<CR>

" replicate buffer commands
tnoremap <silent> <leader>o <C-\><C-n><C-w>o
tnoremap <silent> <leader>c <C-\><C-n>:close<CR>
tnoremap <silent> <leader>bc <C-\><C-n>:bd!<CR>
tnoremap <silent> <leader><tab> <C-\><C-n>:bnext<CR>
tnoremap <silent> <leader><S-tab> <C-\><C-n>:bprev<CR>
" tnoremap <silent> <leader><C-tab> <C-\><C-n>:buffer<space><tab>
tnoremap <silent> <leader><C-tab> <C-\><C-n>:Buffers<CR>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" }}}
" Coc Mappings {{{2

" ensure <CR> always creates newline
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y><CR>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

augroup Coc-Actions
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" }}}
