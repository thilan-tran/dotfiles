hi clear
if exists("syntax_on")
  syntax reset
endif

" extend onedark
runtime colors/onedark.vim
let g:colors_name = "custom_onedark"

let s:red = "#e06c75"
let s:dark_red = "#be5046"
let s:green = "#98c379"
let s:yellow = "#e5c07b"
let s:dark_yellow = "#d19a66"
let s:blue = "#61afef"
let s:purple = "#c678dd"
let s:cyan = "#56b6c2"

function! s:color(group, ...)
  let histring = 'hi ' . a:group . ' guifg=' . a:1
  execute histring
endfunction

" general
call s:color("String", s:yellow)
call s:color("Character", s:yellow)
call s:color("Number", s:purple)
call s:color("Boolean", s:cyan)
call s:color("Function", s:green)
call s:color("Conditional", s:red)
call s:color("Operator", s:red)

" css
call s:color("cssClassName", s:green)
call s:color("cssClassNameDot", s:green)
call s:color("cssPseudoClassId", s:cyan)
call s:color("cssUnitDecorators", s:red)

" html
call s:color("htmlArg", s:green)

" javascript
call s:color("jsArrowFunction", s:cyan)
call s:color("jsExport", s:red)
call s:color("jsExportDefault", s:red)
call s:color("jsExtendsKeyword", s:red)
call s:color("jsFrom", s:red)
call s:color("jsFuncArgs", s:dark_yellow)
call s:color("jsFuncCall", s:green)
call s:color("jsGlobalObjects", s:blue)
call s:color("jsImport", s:red)
call s:color("jsModuleAs", s:red)
call s:color("jsOperator", s:red)
call s:color("jsReturn", s:red)
call s:color("jsSpreadOperator", s:red)
call s:color("jsStorageClass", s:cyan)
call s:color("jsVariableDef", s:blue)

" python
call s:color("pythonBuiltin", s:green)
call s:color("pythonClass", s:blue)
call s:color("pythonInclude", s:red)
call s:color("pythonException", s:red)
call s:color("pythonExceptions", s:cyan)
call s:color("pythonFunction", s:green)
call s:color("pythonOperator", s:purple)
call s:color("pythonStatement", s:red)
call s:color("pythonParameters", s:dark_yellow)

" xml / jsx
call s:color("xmlAttrib", s:green)
call s:color("xmlEndTag", s:blue)
call s:color("xmlTag", s:blue)
call s:color("xmlTagName", s:blue)
call s:color("xmlEqual", s:red)

" italics
highlight Comment cterm=italic gui=italic
highlight jsFuncArgs cterm=italic gui=italic
highlight pythonParameters cterm=italic gui=italic
