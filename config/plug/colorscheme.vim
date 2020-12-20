function! SynStack()
  if !exists("*synstack")
    return endif
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <F10> :call SynStack()<CR>

syntax on
set background=dark
if has('gui_macvim')
    let g:one_allow_italics = 1
    colorscheme one
    call one#highlight('VertSplit', '5c6370', '5c6370', 'none')
else
    let g:onedark_termcolors=256
    colorscheme onedark
endif
" lightline config
set laststatus=2 noshowmode
let g:lightline={
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'myfilename'],
  \             [ 'tagbar' ],
  \           ],
  \   'right': [ [ 'lineinfo' ],
  \            [ 'gitbranch', 'percent' ],
  \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'myfilename': 'LightlineFilename',
  \   'gitbranch': 'FugitiveHead',
  \   'tagbar': 'lightline_tagbar#component'
  \ }
  \ }

function! LightlineFilename()
    return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
          \ (expand('%:p:.') !=# '' ? expand('%:p:.') : '[No Name]') .
          \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction
function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction
function! LightlineModified()
    return &modifiable && &modified ? '+' : ''
endfunction
" airline config
let g:airline_theme='fruit_punch'

" rainbow
au FileType c,cpp,py,pyw call rainbow#load()
let g:rainbow_active = 0

" Python Syntax
let g:python_highlight_all = 1

" PHP syntax
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
let php_var_selector_is_identifier = 0
