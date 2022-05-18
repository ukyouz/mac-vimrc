" LeaderF
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight = 0.33
let g:Lf_PopupHeight = 0.33
let g:Lf_PopupWidth = 0.75
let g:Lf_PopupPosition = [1, 0]
let g:Lf_PopupPreviewPosition = 'bottom'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
" let g:Lf_PreviewWidth = 0
" let g:Lf_PreviewHeight = 0
let g:Lf_PreviewResult = {
    \ 'File': 0,
    \ 'Buffer': 0,
    \ 'Mru': 0,
    \ 'Tag': 1,
    \ 'BufTag': 0,
    \ 'Function': 0,
    \ 'Line': 1,
    \ 'Colorscheme': 1,
    \ 'Rg': 0,
    \ 'Gtags': 1,
\}
let g:Lf_DevIconsFont = 'FuraCode Nerd Font Mono'
let g:Lf_ShowDevIcons = 1
let g:Lf_RgHighlightInPreview = 1
let g:Lf_StlColorscheme = 'one'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_RgConfig = ['--glob=!git/*', '--threads', '8', '-S']
augroup rg_config_specify_setting
    autocmd!
    autocmd FileType c,cpp  let g:Lf_RgConfig += ['-tasm', '-tc']
    autocmd FileType python let g:Lf_RgConfig += ['--type-add', 'py:*.pyw', '-tpy']
augroup END
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_ReverseOrder = 1
" let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_CacheDirectory = expand('~')
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')
let g:Lf_JumpToExistingWindow = 0
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

let g:Lf_ShortcutF = "<leader>p"

let g:Lf_NormalMap = {
    \ "_":      [["<C-j>", "j"],
    \            ["<C-k>", "k"]
    \           ],
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Gtags":  [["<ESC>", ':exec g:Lf_py "gtagsExplManager.quit()"<CR>']],
    \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<CR>']],
    \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Rg":     [["<ESC>", ':exec g:Lf_py "rgExplManager.quit()"<CR>']],
    \ "Line":   [["<ESC>", ':exec g:Lf_py "lineExplManager.quit()"<CR>']],
    \ "History":[["<ESC>", ':exec g:Lf_py "historyExplManager.quit()"<CR>']],
    \ "Help":   [["<ESC>", ':exec g:Lf_py "helpExplManager.quit()"<CR>']],
    \ "Self":   [["<ESC>", ':exec g:Lf_py "selfExplManager.quit()"<CR>']],
    \ "Colorscheme": [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']]
\}

" noremap <leader>p :LeaderfFile<CR>
" noremap <leader>lb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>lm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>l :LeaderfSelf<CR>
noremap <leader>lt :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>ll :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <Leader>r :Leaderf rg<CR>
noremap <Leader>lf :Leaderf rg --fuzzy<CR>
" noremap <Leader>lb :Leaderf rg --current-buffer<CR>
" noremap <Leader>f :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
noremap <Leader>j :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
noremap <Leader>k :<C-U><C-R>=printf("Leaderf! rg -w %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <Leader>j :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
xnoremap <Leader>k :<C-U><C-R>=printf("Leaderf! rg -F -w %s ", leaderf#Rg#visual())<CR><CR>
" restore latest search
noremap <Leader>u :<C-U>Leaderf! rg --recall<CR>
noremap <F4>      :<C-U>Leaderf! rg --next<CR>
noremap <S-F4>    :<C-U>Leaderf! rg --prev<CR>

" should use `Leaderf gtags --update` first
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>t :Leaderf gtags<CR>
noremap <leader>lr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>ld :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <C-]>      :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>lu :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" noremap <F4>       :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap <S-F4>     :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

noremap \ :LeaderfRgInteractive<CR>

let g:Lf_CommandMap = {'<C-K>': ['<Up>', '<C-K>'], '<C-J>': ['<Down>', '<C-J>']}

