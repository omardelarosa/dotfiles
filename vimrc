set shiftwidth=2 softtabstop=2
set nocompatible              " be iMproved
filetype off                  " required!
syntax on
set autoindent
set smartindent
set encoding=utf-8

" show line numbers
set number
" toggle line numbers
map <C-T><C-T> :set invnumber<CR>

" key bindings
map <F7> :bp <CR>
map <F6> :bn <CR>

" Incremental Search
set incsearch
set hlsearch

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Autoreads the file on changes
set autoread

set rtp+=~/.vim/bundle/Vundle.vim

" Prevents Git issues with Vundle
let $GIT_SSL_NO_VERIFY = 'true'

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
Plugin 'ack.vim'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Ruby Syntax Highlighting
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin 'nerdtree-ack'
" JavaScript Syntax Highlight
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Syntastic'
" Syntastic options
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': '[possibly useless use of a variable in void context|interpreted as argument prefix]'}

" Ctrl+P
set runtimepath^=~/.vim/bundle/ctrlp.vim
" do not switch buffer if file already open
let g:ctrlp_switch_buffer = 'Et'
" Do not open new window if able
let g:ctrlp_reuse_window = 'netrw'
" Determines root of search to be first parent with .git, etc
let g:ctrlp_working_path_mode = 'ra'
" Enable/disable per-session caching
" let g:ctrlp_use_caching = 1

" Enable/disable cross-session caching
let g:ctrlp_clear_cache_on_exit = 1

" Plugins go before this
call vundle#end()            " required

" NERDTree Options
let NERDTreeMouseMode=2


" always load ... "
" autocmd vimenter * NERDTree "

" only load if no file specified  ... "
autocmd vimenter * if !argc() | NERDTree | endif

" Toggle Nerdtree with Ctrl+n"
map <C-n> :NERDTreeToggle<CR>
syntax enable
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

" Ack command
let g:ackprg = 'ag --vimgrep'

" always split windows vertically
" via: https://www.reddit.com/r/vim/comments/2irn8j/vertical_split_by_default/

set splitright
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  cabbrev split vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
else
  cabbrev hsplit hor split
endif

" Set file type to language
if has("syntax")
  syntax on
  filetype on
  au BufNewFile,BufRead *.jq,*.es,*.jsx set filetype=javascript
  au BufNewFile,BufRead *.coffee set filetype=coffee
endif

" Statusline Customizations
set laststatus=2
set ambiwidth=single
set noshowmode
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
