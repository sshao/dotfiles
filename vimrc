set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin("~/.vim/bundle/")

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'ntpeters/vim-better-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

autocmd! bufwritepost vimrc source ~/.vimrc
autocmd FileType gitcommit DiffGitCached | wincmd = | wincmd p

syntax enable
set background=dark
colorscheme solarized

set backspace=indent,eol,start

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set ai
set si
set wrap

set nu

set ruler

set hlsearch

set laststatus=2
set encoding=utf-8
set t_Co=256

" disable arrow keys in command modes
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
