" gtags
set cscopetag
set cscopeprg=gtags-cscope
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
" gutentags搜索工程目錄的標誌，碰到這些文件/目錄名就停止向上一級目錄遞歸 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_exclude_filetypes = ['scss', 'css', 'html', 'txt', 'markdown', 'vim']
" 同時開啟ctags和gtags支援
let g:gutentags_modules = []
" if executable('ctags')
" 	let g:gutentags_modules += ['ctags']
" endif
" if executable('cscope')
" 	let g:gutentags_modules += ['cscope']
" endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" 所生成的數據文件的名稱 "
" let g:gutentags_ctags_tagfile = '.tags'
" 將自動生成的 tags 文件全部放入 ~/.cache/tags 目錄中，避免污染工程目錄 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 檢測 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
