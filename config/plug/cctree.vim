let g:CCTreeWindowMinWidth = 40

function! GetCscopeFile()
    let l:root = fnamemodify(resolve(expand('%:p', 1)), ':p:h')
    let l:str = substitute(l:root, '/', '-', 'g')
    let l:str = substitute(l:str, '^-', '', '') . '-cscope.out'
    let l:path = g:gutentags_cache_dir . '/' . l:str
    echom l:str
    return l:path
endfunction

if !exists('g:cctree_root')
    let g:cctree_root = fnamemodify(resolve(expand('%:p', 1)), ':p:h')
endif
function! LoadCCTreeDB()
    if g:cctree_root != fnamemodify(resolve(expand('%:p', 1)), ':p:h')
        let g:cctree_root = fnamemodify(resolve(expand('%:p', 1)), ':p:h')
        :execute 'CCTreeLoadDB ' . GetCscopeFile()
    endif
endfunction
augroup cctreeLoadDb
    autocmd!
    autocmd FileType c,cpp call LoadCCTreeDB()
augroup END
