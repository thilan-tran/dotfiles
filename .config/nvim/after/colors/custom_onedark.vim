" custom_onedark.vim
" ==================
" extend onedark with custom highlighting

hi clear
if exists("syntax_on")
  syntax reset
endif

runtime colors/onedark.vim
let g:colors_name = "custom_onedark"

" onedark colors
" --------------
let s:red = ["#e06c75", "1"]
let s:dark_red = ["#be5046", "9"]
let s:green = ["#98c379", "2"]
let s:yellow = ["#e5c07b", "3"]
let s:dark_yellow = ["#d19a66", "11"]
let s:blue = ["#61afef", "4"]
let s:purple = ["#c678dd", "5"]
let s:cyan = ["#56b6c2", "6"]
let s:white = ["#ffffff", "7"]

function! s:color(group, ...)
  let histring = 'hi ' . a:group . ' guifg=' . a:1[0] . ' ctermfg=' . a:1[1]
  execute histring
endfunction

" updated colors per filetype
" ---------------------------

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
call s:color("jsxBraces", s:white)
call s:color("jsxTag", s:white)

" typescript
call s:color("typescriptFuncKeyword", s:purple)
call s:color("typescriptArrowFunc", s:cyan)
call s:color("typescriptImport", s:red)
call s:color("typescriptExport", s:red)
call s:color("typescriptIdentifierName", s:green)
call s:color("typescriptAssign", s:red)
call s:color("typescriptUnaryOp", s:red)
call s:color("typescriptBinaryOp", s:red)
call s:color("typescriptGlobal", s:blue)
call s:color("typescriptStatementKeyword", s:red)
call s:color("typescriptArrayMethod", s:green)
call s:color("typescriptHeadersMethod", s:green)
call s:color("typescriptMathStaticMethod", s:green)
call s:color("typescriptRestOrSpread", s:red)
call s:color("typescriptObjectSpread", s:red)
call s:color("typescriptVariableDeclaration", s:blue)
call s:color("typescriptVariable", s:cyan)
" clear colors
call s:color("typescriptFileListMethod", s:white)
call s:color("typescriptDestructureVariable", s:white)
call s:color("typescriptFuncComma", s:white)
call s:color("typescriptObjectLabel", s:white)
call s:color("typescriptBOM", s:white)
call s:color("typescriptBOMHistoryProp", s:white)
call s:color("typescriptPaymentShippingOptionProp", s:white)
call s:color("typescriptPaymentAddressProp", s:white)
call s:color("typescriptDOMFormProp", s:white)
call s:color("typescriptDOMDocProp", s:white)

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
" highlight Comment cterm=italic gui=italic
highlight jsFuncArgs cterm=italic gui=italic
highlight typescriptCall ctermfg=3 cterm=italic gui=italic
highlight pythonParameters cterm=italic gui=italic
