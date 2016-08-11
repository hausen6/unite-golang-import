" ========================
" This is a unite source plugin for golang packages
"
" Author: hausen6
" Licence: MIT
" ========================
"

" create source object
let s:unite_source = {
            \ "name": "golang-import",
            \ }

" main function
function! s:unite_source.gather_candidates(args, context)
  let path = expand('#:p')
  let lines = getbufline('#', 1, '$')
  let format = '%' . strlen(len(lines)) . 'd: %s'
  return map(lines, '{
  \   "word": printf(format, v:key + 1, v:val),
  \   "source": "golang-import",
  \   "kind": "jump_list",
  \   "action__path": path,
  \   "action__line": v:key + 1,
  \ }')
endfunction

" register unite source
call unite#define_source(s:unite_source)
unlet s:unite_source
