" LeaderF
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'bottom'
let g:Lf_WindowHeight = 0.33
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
" let g:Lf_PreviewWidth = 0
" let g:Lf_PreviewHeight = 0
let g:Lf_PreviewResult = { 'BufTag': 1, 'Function': 1, 'Colorscheme': 1 }
let g:Lf_DevIconsFont = 'FuraCode Nerd Font Mono'
let g:Lf_ShowDevIcons = 1
let g:Lf_RgHighlightInPreview = 1
let g:Lf_StlColorscheme = 'one'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_RgConfig = ['--glob=!git/*', '--hidden', '--threads', '8', '-S']
augroup rg_config_specify_setting
    autocmd!
    autocmd FileType c,cpp  let g:Lf_RgConfig += ['-tasm', '-tc']
    autocmd FileType python let g:Lf_RgConfig += ['--type-add', 'py:*.pyw', '-tpy']
augroup END
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_ReverseOrder = 1
let g:Lf_CacheDirectory = expand('~')
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')
let g:Lf_GtagsGutentags = 1
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsAutoUpdate = 0
let g:Lf_GtagsSkipUnreadable = 1
let g:Lf_HighlightIndividual = 1
let g:Lf_WildIgnore = {
    \ 'dir': ['.svn','.git','.hg','.*'],
    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.launch','*.xml']
    \}
let g:Lf_RootMarkers = ['.root', '.git', '.svn', '.vscode']

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>p :LeaderfFile<CR>
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <Leader>r :Leaderf rg<CR>
noremap <Leader>ff :Leaderf rg<CR>
noremap <Leader>fb :Leaderf rg --current-buffer<CR>
" noremap <Leader>f :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
noremap <Leader>j :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <Leader>j :<C-U><C-R>=printf("Lederf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
" restore latest search
noremap <Leader>u :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>t :Leaderf gtags<CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fu :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <F4>       :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <S-F4>     :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

noremap \ :LeaderfRgInteractive<CR>
