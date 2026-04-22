call plug#begin('~/.vim/plugged')

" Catppuccin Mocha theme with low-contrast comments brightened.
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
autocmd ColorScheme catppuccin_mocha highlight Comment guifg=#d2d5df gui=italic

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

" LIGHTLINE CONFIGURATION
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filesize', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %l/%L:%c',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filesize': 'LightlineFileSize'
      \ },
      \ }

" Always show the status line.
set laststatus=2
" Hide the default mode text since lightline shows it.
set noshowmode
" But show the standard selection info.
set showcmd

" Press Ctrl+p to find files in the current directory.
nnoremap <C-p> :Files<CR>
" Press Ctrl+g to search for text inside all files (requires ripgrep).
nnoremap <C-g> :Rg<CR>
" Press Ctrl+b to see open buffers (tabs).
nnoremap <C-b> :Buffers<CR>
" Space clears search result highlights.
nnoremap <Space> :nohlsearch<Bar>:echo "Highlights Cleared"<CR>

colorscheme catppuccin_mocha
syntax on
filetype plugin indent on
set termguicolors
set background=dark
set number relativenumber
set cursorline
set mouse=a
set clipboard=unnamed,unnamedplus
set scrolloff=8
set ignorecase smartcase incsearch hlsearch
set expandtab shiftwidth=4 tabstop=4

" Filetype-specific overrides.
autocmd FileType go setlocal noexpandtab
autocmd FileType javascript,typescript,kotlin setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.ghostty,config.ghostty set filetype=conf

" Restore cursor position to the last known line when opening a file.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

