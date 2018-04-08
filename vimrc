" Default Tab Prefs
set shiftwidth=2 softtabstop=2 expandtab smarttab

set nocompatible              " be iMproved
filetype off                  " required!
syntax on
set autoindent
set smartindent

" correct backspace behavior
set backspace=2

" show line numbers
set number
" toggle line numbers
map <C-T><C-T> :set invnumber<CR>

" Switch panes
map <M-Right> <C-w>w

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

"Sets goto
map gtf :YcmCompleter GoToDefinition<CR>
map gtt :YcmCompleter GoToDeclaration<CR>
map gt :YcmCompleter Goto<CR>


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
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Lokaltog/vim-powerline'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'

" Clojure
Plugin 'tpope/vim-fireplace.git'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" JavaScript Syntax Highlight
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Syntastic'
Plugin 'posva/vim-vue'
Plugin 'Quramy/vim-js-pretty-template'

" Beautification
Plugin 'maksimr/vim-jsbeautify'
Plugin 'prettier/vim-prettier'

" Other stuff
Plugin 'wavded/vim-stylus'
Plugin 'kylef/apiblueprint.vim'
Plugin 'jade.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ianks/vim-tsx'
Plugin 'Shougo/unite.vim'
Plugin 'mhartington/vim-typings'
Plugin 'lilydjwg/colorizer'
Plugin 'tpope/vim-surround' " enables surrounding of string with some type of grouping char
Plugin 'dag/vim-fish' " enables fish shell support

" Enables auto-pairing closing tags of characters like (, { and [
Plugin 'jiangmiao/auto-pairs'

" Elm
Plugin 'lambdatoast/elm.vim'

" Syntastic options
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_coffee_coffeelint_checker = 1
let g:syntastic_coffee_coffeelint_args = "--file ~/.coffeelint.json"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = [ 'rubocop' ]
let g:syntastic_delayed_redraws=1
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 0
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Elm
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

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

" AutoPairing of Parens, etc
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" Ignore

set wildignore+=*/tmp/*,*/public/assets/*,*/vendor/assets/*,*/node_modules/*,*.so,*.swp,*.zip,/Users/omardelarosa/Code/vclamp/src/web/lib,/Users/omardelarosa/Code/vclamp/src/web-core/lib,/Users/omardelarosa/Code/vclamp/src/web-core/coverage,*/tsDist/*


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
  au BufNewFile,BufRead *.pug,*.jade set filetype=jade
  au BufNewFile,BufRead *.ts,*.tsx set filetype=typescript
  au BufNewFile,BufRead *.jq,*.es,*.jsx,*.js,*.karma set filetype=javascript
  au BufNewFile,BufRead *.coffee,*.cjsx set filetype=coffee
  au BufNewFile,BufRead *.apib set filetype=apiblueprint
  au BufNewFile,BufRead *.vue set filetype=vue
  au BufNewFile,BufRead *.styl,*.stylus,*.sjsx set filetype=stylus
  au BufNewFile,BufRead *.elm set filetype=elm
  au BufNewFile,BufRead *.cpp set filetype=cpp
  au BufNewFile,BufRead *.fish set filetype=fish
endif

" Syntax Highlight Template Literals In JS
autocmd FileType javascript JsPreTmpl html
autocmd FileType typescript JsPreTmpl html
autocmd FileType javascript JsPreTmpl css
autocmd FileType typescript JsPreTmpl css
autocmd FileType javascript JsPreTmpl markdown
autocmd FileType typescript JsPreTmpl markdown
autocmd FileType javascript JsPreTmpl stylus
autocmd FileType typescript JsPreTmpl stylus

autocmd FileType typescript syn clear foldBraces

" Beautify JS
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" TypeScript options
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript setlocal completeopt-=menu

" YouCompleteMe Autocomplete
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3

" Autoclose window after completion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filetype_blacklist = {
      \ 'markdown': 1,
      \ 'text': 1,
      \ 'json': 1
      \}

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'


" SpellChecking
setlocal spell spelllang=en_us
autocmd FileType * sy spell notoplevel

" Statusline Customizations
set laststatus=2
set ambiwidth=single
set noshowmode
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Close tag support for various filetypes
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.tsx"

" Visually display matching braces
set showmatch

" Prevent goofy backup files
set nobackup

" Prevent the creation of swp files, they're just a mess
set noswapfile

" No bells
set noerrorbells

" Encoding
set encoding=utf-8
set t_Co=256

" Automatically Colorize Hex/RGB values
" let g:colorizer_auto_color = 1
" let g:colorizer_auto_filetype = 'css,html,styl,stylus'
" let g:colorizer_skip_comments = 1

" set colortheme to koehler
colorscheme koehler

" Load language specific configutarions
autocmd! BufNewFile,BufReadPre,FileReadPre *.cpp so ~/.vim/cpp.vim
autocmd! BufNewFile,BufReadPre,FileReadPre *.h so ~/.vim/cpp.vim
" autocmd! BufNewFile,BufReadPre,FileReadPre *.ts so ~/.vim/tsx.vim
" autocmd! BufNewFile,BufReadPre,FileReadPre *.tsx so ~/.vim/tsx.vim
" autocmd! BufNewFile,BufReadPre,FileReadPre *.js so ~/.vim/js.vim

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
