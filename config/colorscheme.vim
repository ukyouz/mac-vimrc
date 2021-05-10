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

" go current tag
function! CurrentTagSearch()
    let l:cursor_pos = getpos('.')
    let l:tag = split(lightline_tagbar#component(), '(')[0]
    let l:search_term = l:tag
    if &filetype ==# 'c'
        " void main()
        " static void main()
        " ICODE static void main()
        let l:search_term = '^\s*\(\(\w\+\)\s\+\)\+'.l:tag
    elseif &filetype ==# 'python'
        " def __init__():
        let l:search_term = '^\s*def\s\+'.l:tag
    endif
    " push current cursor position to jump list
    execute "normal " . l:cursor_pos[1] . "G" . (l:cursor_pos[2]-1) . "|"
    " echo l:search_term
    call search(l:search_term, 'cb')
    call search(l:tag, 'c', line('.'))
endfunction
nnoremap <silent> <leader>gt :call CurrentTagSearch()<CR>

" rainbow
if has_key(g:plugs, 'vim-rainbows')
  au FileType c,cpp,py,pyw call rainbow#load()
  let g:rainbow_active = 0
endif

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

let g:rainbow_guifgs = ['gray', 'lightblue']
let g:rainbow_ctermfgs = ['lightgray', 'lightblue', 'magenta']

" treesitter for onrdark.nvim
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
}
EOF
