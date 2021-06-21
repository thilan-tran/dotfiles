" markdown.vim
" ============
" custom behavior for markdown files

" custom folding of headers
" -------------------------
function! MarkdownFold()
  let line = getline(v:lnum)

  " regular headers
  let depth = match(line, '\(^#\+\)\@<=\( .*$\)\@=')
  if depth > 0
    return ">" . depth
  endif

  " setext-styled headings
  let prevline = getline(v:lnum - 1)
  let nextline = getline(v:lnum + 1)
  if (line =~ '^.\+$') && (nextline =~ '^=\+$') && (prevline =~ '^\s*$')
    return ">1"
  endif

  if (line =~ '^.\+$') && (nextline =~ '^-\+$') && (prevline =~ '^\s*$')
    return ">2"
  endif

  " auto fold frontmatter
  if (v:lnum == 1) && (line =~ '^----*$')
	  return ">2"
  endif

  return "="
endfunction

set foldtext=GetFoldText() " custom fold text
