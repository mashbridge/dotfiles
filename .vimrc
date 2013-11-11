set nocompatible

" Go language plugins, syntax, etc.
set rtp+=$GOROOT/misc/vim
autocmd FileType go compiler golang

syntax on
filetype on
filetype plugin on
filetype indent on
colorscheme desert 

" Backup
set directory=$HOME/.vimbak
set backup writebackup
set backupdir=$HOME/.vimbak
set backupskip=/tmp/*,/var/tmp/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set history=200  " Store last 200 commands as history.

" Store in .viminfo: marks for 50 files, 200 lines of registers.
set viminfo='50,\"200
set updatecount=40  " Number of characters typed before updating swapfile.
set updatetime=1000 " Milliseconds before updating swapfile.
set suffixes=.bak,~,.o,.swp

" Tabs are 2 spaces. As if there's any other way.
set expandtab
set shiftwidth=2
set softtabstop=2

" Let's give indentation one more try:
set autoindent
" Makefiles and friends need tabs.
autocmd FileType make setlocal noet sw=8 sts=8
autocmd FileType config setlocal noet sw=8 sts=8
" Go too, although gofmt enforces this.
autocmd FileType go setlocal noet sw=8 sts=8

" Helper stuff:
set backspace=2
set hlsearch  " Highlight previous search results
set incsearch
set ruler
set showcmd
set showmatch
set showmode
set wmnu

" Tab-complete filenames to longest unambiguous match and present menu:
set wildmenu wildmode=list:longest,list:full

" When editing a file, jump to the last cursor position unless the position
" is invalid or we're inside an event handler (e.g. dropped a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" The default syntax color for comments (on a black background) is too dark.
" hi Comment ctermfg=cyan

