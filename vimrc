set shiftwidth=2 softtabstop=2
set nocompatible              " be iMproved
filetype off                  " required!
:syntax on
:set autoindent
:set smartindent

" show line numbers
:set number

" key bindings
:map <F7> :bp <CR>
:map <F6> :bn <CR>

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"Plugings go after this

"colorscheme monokai

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Ruby Syntax Highlighting
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'

" Plugins go before this
call vundle#end()            " required


" Load NERDTree on start"

" always load ... "
" autocmd vimenter * NERDTree "

" only load if no file specified  ... "
autocmd vimenter * if !argc() | NERDTree | endif

" Toggle Nerdtree with Ctrl+n"
map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" added zenburn color theme
":colorscheme zenburn
