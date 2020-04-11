" python.vim
" ==========
" custom behavior for python files

" custom syntax highlighting
syn match pParam /\i*\(\i*(\)\@!/ contained
syn match pKeyword /\i*\ze\s*=[^=]/ contained
syn match pVars /\v\(\zs.*\ze\)/ contains=pKeyword,pParam
syn keyword pythonSelf self

highlight def link pKeyword pythonParameters
highlight pythonSelf guifg=#E5C07B
