" neovim sets
syntax on
syntax enable
set path+=**
set scrolloff=8
set termguicolors
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set signcolumn=yes
set colorcolumn=80
set relativenumber
set nowrap 
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set encoding=utf-8
set smartindent
set clipboard=unnamed
" Plugins :3
call plug#begin('~/AppData/Local/nvim/plugged')

" Themes:
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'

Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'codota/tabnine-vim'
" Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'dracula/vim'
Plug 'styled-components/vim-styled-components' 
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'arzg/vim-colors-xcode'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Autocompletado
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Telescope add-ons?
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" Theme things
colorscheme dracula
set background=dark 
let g:colorscheme_bg  = "dark"

let NERDTreeQuitOnOpen = 1

" leader
let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
" require('telescope').load_extension('fzf')

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Telescope config / https://github.com/nvim-telescope/telescope.nvim
lua << EOF
require('telescope').setup{
    defaults = {
        prompt_prefix = "$.$ " 
        } 
}
require('telescope').load_extension('coc')

EOF

" Icons config / https://github.com/kyazdani42/nvim-web-devicons
lua << EOF
require('nvim-web-devicons').setup {
}
require'nvim-web-devicons'.get_icons()
EOF

" Remaps
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <leader> gr <Plug>(coc-references)
