" set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" syntax
Plug 'othree/html5.vim'
" Plug 'vim-python/python-syntax'
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'StanAngeloff/php.vim'
Plug 'nvim-treesitter/nvim-treesitter' ",{'do': ':TSUpdate'}   We recommend updating the parsers on update
" Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" vim enhancement
Plug 'sheerun/vim-polyglot'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/vim-startify'
Plug 'metakirby5/codi.vim'
Plug 'preservim/nerdtree'
" Plin 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'
Plug 'rlane/pounce.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'skywind3000/vim-preview'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" coc
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'ray-x/lsp_signature.nvim'
" Plug 'aceofall/gtags.vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" Plug 'Shougo/denite.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/LeaderF'
" Plug 'tamago324/LeaderF-filer'
" Plug 'linjiX/LeaderF-git'
" Plug 'hari-rangarajan/CCTree'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'

" colorscheme
Plug 'itchyny/lightline.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
" Plug 'folke/twilight.nvim'
" Plug 'navarasu/onedark.nvim'
Plug 'ukyouz/onedark.vim'
" Plug 'rakr/vim-colors-rakr'
" Plug 'nightsense/carbonized'
" Plug 'lifepillar/vim-solarized8'
" Plug 'frazrepo/vim-rainbow'

" git-enhanced
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Initialize plugin system
call plug#end()
filetype plugin indent on    " required

" map ; :
" imap kj <Esc>
" imap jk <Esc>
" command-, in mac, gui only
nnoremap <D-,> @@
let mapleader = ' '

let $VIMRC = "~/.config/nvim/config"
" source $VIMRC/cctree.vim
" source $VIMRC/coc.vim
source $VIMRC/colorscheme.vim
" source $VIMRC/denite.vim
" source $VIMRC/fzf.vim
source $VIMRC/git-enhanced.vim
source $VIMRC/gtags.vim
source $VIMRC/leaderf.vim
source $VIMRC/lspconfig.vim
source $VIMRC/nerdtree.vim
source $VIMRC/pounce.vim
source $VIMRC/startify.vim
source $VIMRC/treesitter.vim
source $VIMRC/vim-enhancement.vim
" source $VIMRC/vim-extended-surround-block-element.vim
source $VIMRC/vim-grep.vim
source $VIMRC/vim-highlightedyank.vim
" source $VIMRC/vim-lsp-cxx-highlight.vim
source $VIMRC/vim-preview.vim

""Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusting split sizes a bit more friendly
noremap <silent> <C-Left>   :vertical resize -5<CR>
noremap <silent> <C-Right>  :vertical resize +5<CR>
noremap <silent> <C-Up>     :resize +3<CR>
noremap <silent> <C-Down>   :resize -3<CR>

" custom system copy
inoremap <silent> <C-v> <Esc>"*pa
vnoremap <silent> <C-c> "*y

nnoremap <silent> <F3> :noh<CR>

noremap <C-\> :vsp<CR>
" noremap <C-`> :vsp \| terminal<CR>

" Genreal
set path+=**
"set clipboard=unnamed
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set list listchars=tab:\▸\ ,trail:·,extends:»,precedes:«,nbsp:×
set ttimeoutlen=50
"set fillchars+=vert:\█
set guifont=FiraCode\ Nerd\ Font:h13
set linespace=4
if has('gui_macvim')
    set macligatures
endif
"set foldmarker={{{,}}}
set foldmethod=manual
set belloff=all
"set foldlevel=0 foldnestmax=1 scrolloff=5 " default all close
set nowrapscan
set splitbelow splitright
" set autoindent smartindent
set nowrap ruler
set wildmenu
set hlsearch incsearch
set cursorline
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber    cursorline
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber  nocursorline
augroup END
set title titleold= titlestring=%{getcwd()}
" disable backup and allow unsaved buffer
set hidden
set nobackup noswapfile
set undodir=~/.undodir

" autocmd! bufwritepost $VIMRC/vimrc source %
