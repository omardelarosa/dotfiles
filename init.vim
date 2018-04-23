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

" Speed optimizations
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column

set nocompatible              " be iMproved
filetype off                  " required!
syntax on
set autoindent
set smartindent

" VMP3 tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

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

" Allows clipboard sharing
set clipboard=unnamed

call plug#begin('~/.vim/plugged')

Plug 'vim-syntastic/syntastic'
Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do': 'make'}

" C++
Plug 'octol/vim-cpp-enhanced-highlight'

" JavaScript Syntax Highlight
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'posva/vim-vue'
Plug 'Quramy/vim-js-pretty-template'

" Beautification
Plug 'maksimr/vim-jsbeautify'

" Other stuff
Plug 'wavded/vim-stylus'
Plug 'kylef/apiblueprint.vim'
Plug 'ianks/vim-tsx'
Plug 'Shougo/unite.vim'
Plug 'mhartington/vim-typings'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-surround' " enables surrounding of string with some type of grouping char
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'

" Enables auto-pairing closing tags of characters like (, { and [
Plug 'jiangmiao/auto-pairs'

" Elm
Plug 'lambdatoast/elm.vim'

" Completion
Plug 'mhartington/nvim-typescript'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/vim-hug-neovim-rpc'

" TS Syntax
Plug 'HerringtonDarkholme/yats.vim'

" Enable Deoplete at startup
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

let g:deoplete#enable_at_startup = 1

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
let syntastic_mode_map = { 'passive_filetypes': ['html', 'xml'] }
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 0
let g:syntastic_typescript_checkers = ['tslint']

" YouCompleteMe Autocomplete
" let g:ycm_min_num_of_chars_for_completion = 99
" let g:ycm_min_num_identifier_candidate_chars = 1
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
" syntax enable
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

" YouCompleteMe options
let g:ycm_auto_trigger = 0
" let g:ycm_extra_conf_globlist = ['~/Code/vclamp/src/web/lib/*','!~/Code/vclamp/src/web-core/lib/*']
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0

" Set ag as default grep program
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Ignore
set wildignore+=*/tmp/*,*/public/assets/*,*/vendor/assets/*,*/node_modules/*,*.so,*.swp,*.zip,*/jspm_packages,*/.tmp/*,*/vendor/*,*/coverage/*,*/compiled-libraries/*,*/dist/*,*/img/*,*/fonts/*,*/jasmine-reports/*,*/typings/*,*/.sass-cache/*,*/.vscode/*,*/build/*,*/preprocessed/*,*/tools/*

" Clipboard
set clipboard=unnamed

" Set file type to language
if has("syntax")
  syntax on
  filetype on
  au BufNewFile,BufRead *.pug,*.jade set filetype=jade
  au BufNewFile,BufRead *.ts,*.tsx set filetype=typescript
  au BufNewFile,BufRead *.jq,*.es,*.jsx,*.js,*.karma set filetype=javascript
  au BufNewFile,BufRead *.json5 set filetype=json
  au BufNewFile,BufRead *.coffee,*.cjsx set filetype=coffee
  au BufNewFile,BufRead *.apib set filetype=apiblueprint
  au BufNewFile,BufRead *.vue set filetype=vue
  au BufNewFile,BufRead *.styl,*.stylus set filetype=stylus
  au BufNewFile,BufRead *.elm set filetype=elm
endif

" Syntax Highlight Template Literals In JS
autocmd FileType javascript JsPreTmpl html
autocmd FileType typescript JsPreTmpl html
autocmd FileType javascript JsPreTmpl css
autocmd FileType typescript JsPreTmpl css

" Beautify JS
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" TypeScript options
autocmd FileType typescript nmap <buffer> <c-]> :TSDef<CR>
" autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" autocmd FileType typescript setlocal completeopt-=menu,preview

let g:tsuquyomi_disable_default_mappings = 1

" SpellChecking
setlocal spell spelllang=en_us
autocmd FileType * sy spell notoplevel

" Statusline Customizations
set laststatus=2
set ambiwidth=single
set noshowmode

" Use powerline fonts with airline
let g:airline_powerline_fonts = 1

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

" Large Files
augroup LargeFile
        let g:large_file = 10000000 " 400KB

        " Set options:
        "   eventignore+=FileType (no syntax highlighting etc
        "   assumes FileType always on)
        "   noswapfile (save copy of file)
        "   bufhidden=unload (save memory when other file is viewed)
        "   buftype=nowritefile (is read-only)
        "   undolevels=-1 (no undo possible)
        au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                        \ set eventignore+=FileType |
                        \ setlocal noswapfile bufhidden=unload undolevels=-1 |
                \ else |
                        \ set eventignore-=FileType |
                \ endif
augroup END

" Automatically Colorize Hex/RGB values
" let g:colorizer_auto_color = 1
" let g:colorizer_auto_filetype = 'css,html,styl,stylus'
" let g:colorizer_skip_comments = 1

" set colortheme to koehler
colorscheme koehler
