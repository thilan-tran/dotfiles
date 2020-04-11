syn keyword pythonSelf self
syn match pVars /\v\(\zs.*\ze\)/ contains=pKeyword,pParam
syn match pParam /\i*\(\i*(\)\@!/ contained
syn match pKeyword /\i*\ze\s*=[^=]/ contained

hi def link pKeyword pythonParameters
highlight pythonSelf guifg=#E5C07B
