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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"colorscheme monokai

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Ruby Syntax Highlighting
Bundle 'vim-ruby/vim-ruby'


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
