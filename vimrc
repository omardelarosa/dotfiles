set shiftwidth=2 softtabstop=2 expandtab smarttab
set nocompatible              " be iMproved
filetype off                  " required!
syntax on
set autoindent
set smartindent
set encoding=utf-8

" correct backspace behavior
set backspace=2

" show line numbers
set number
" toggle line numbers
map <C-T><C-T> :set invnumber<CR>

" key bindings
map <F7> :bp <CR>
map <F6> :bn <CR>

" Sets go to end of line
map ,, ^
" Sets go to start of line
map .. $
" Sets toggle between closing/opening brackets
map mm %
map <C-m> %

" Incremental Search
set incsearch
set hlsearch

" Mouse Scrolling
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

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
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'ack.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin 'nerdtree-ack'
Plugin 'commentary.vim'
Plugin 'closetag'
" Clojure
Plugin 'tpope/vim-fireplace.git'

" JavaScript Syntax Highlight
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Syntastic'

" Other stuff
Plugin 'bendavis78/vim-polymer'

" Syntastic options
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_coffee_coffeelint_checker = 1
let g:syntastic_coffee_coffeelint_args = "--file ~/.coffeelint.json"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': '[possibly useless use of a variable in void context|interpreted as argument prefix]'}

" Ctrl+P
set runtimepath^=~/.vim/bundle/ctrlp.vim
" prevent Ctrl+P from splitting windows and play better with NERDTree
let g:ctrlp_dont_split = 'NERD_tree_2'

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

" Ignore

set wildignore+=*/tmp/*,*/public/assets/*,*/vendor/assets/*,*/node_modules/*,*.so,*.swp,*.zip


" Plugins go before this
call vundle#end()            " required

" NERDTree Options
let NERDTreeMouseMode=2

" always load ... "
" autocmd vimenter * NERDTree "

" only load if no file specified  ... "
autocmd vimenter * if !argc() | NERDTree | endif

" Autoclose Nerdtree on Fileopen
let NERDTreeQuitOnOpen=1

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

" Clipboard
set clipboard=unnamed

" Set file type to language
if has("syntax")
  syntax on
  filetype on
  au BufNewFile,BufRead *.jq,*.es,*.jsx,*.js set filetype=javascript
  au BufNewFile,BufRead *.coffee,*.cjsx set filetype=coffee
endif

" Statusline Customizations
set laststatus=2
set ambiwidth=single
set noshowmode
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Close tag support for various filetypes
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" set colortheme to koehler
colorscheme koehler
