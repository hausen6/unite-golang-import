" ========================
" This is a unite source plugin for golang packages
"
" Author: hausen6
" Licence: MIT
" ========================
let s:save_cpo = &cpo
set cpo&vim

" create source object
let s:source = {
            \ "name": "golang_import",
            \ }


" main function
function! s:source.gather_candidates(args, context)
    " install package lists
    let packages = []
    let packages_path = $GOPATH."/src"
    return map(packages, '{
                \ "word": v:val,
                \}')
  " let path = expand('%:p')
  " let lines = getbufline('%', 1, '$')
  " let format = '%' . strlen(len(lines)) . 'd: %s'
  " echo lines
  " return map(lines, '{
  " \   "word": printf(format, v:key + 1, v:val),
  " \   "source": "golang_import",
  " \   "kind": "jump_list",
  " \   "action__path": path,
  " \   "action__line": v:key + 1,
  " \ }')
endfunction

" define source
function! unite#sources#golang_import#define()
    return s:source
endfunction

" register unite source
call unite#define_source(s:source)

let &cpo = s:save_cpo
unlet s:save_cpo
