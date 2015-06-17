" description
" " Config VIM "
"
" File Name         : .vimrc
" Created By        : Guillaume FAVRE
" Creation Date     : juin  9th, 2015
" Version           : 0.1
" Last Change       : juin 12th, 2015 at 15:27:07
" Last Changed By   : Guillaume FAVRE
"

set number
syntax enable
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/syntastic'

Plugin 'bling/vim-airline'

Plugin 'godlygeek/tabular'

Plugin 'thmsaurel/header'

" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

"Header
let g:header_author = 'Guillaume FAVRE'

"Air-line
let g:airline#extensions#tabline#enabled = 0
set laststatus=2

"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NerdTree
map <C-n> :NERDTreeToggle<CR>
