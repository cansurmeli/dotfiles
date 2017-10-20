
call plug#begin()
"emmet-vim is a vim plug-in which provides support for expanding abbreviations
"similar to emmet.
Plug 'mattn/emmet-vim'

" Distinct highlighting of keywords vs values, JSON-specific (non-JS)
" warnings, quote concealing.
Plug 'elzr/vim-json'

"Add CSS3 syntax support to Vim's built-in syntax/css.vim.
Plug 'hail2u/vim-css3-syntax'

" TENDER: A 24bit colorscheme for Vim, Airline and Lightline (generated by
" Estilo)
Plug 'jacoborus/tender'

" NERD COMMENTER: Comment functions so powerful—no comment necessary.
Plug 'scrooloose/nerdcommenter'

" vim-css-color: A very fast color keyword highlighter for Vim with
" context-sensitive support for many language syntaxes.
Plug 'ap/vim-css-color'

" Syntastic: syntax checking
Plug 'scrooloose/syntastic'

" vim-toml: Vim Syntax for TOML
Plug 'cespare/vim-toml'

" VIM-AIRLINE: Lean & mean status/tabline for vim that's light as air.
Plug 'bling/vim-airline'

" Solarized Color Scheme
Plug 'altercation/vim-colors-solarized'

" CTRLP: Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'kien/ctrlp.vim'

" YouCompleteMe: A code completio engine for Vim
"Plug 'valloric/youcompleteme'

" html5.vim: HTML5 omnicomplete and syntax
Plug 'othree/html5.vim'

" vim-arduino-syntax: Arduino syntax files
Plug 'sudar/vim-arduino-syntax'

" vim-airline: lean & mean status/tabline
Plug 'bling/vim-airline'

" ag: search using the silver searcher
Plug 'ervandew/ag'

" swift: Swift support including syntax, indenting and more through Syntastic
Plug 'keith/swift.vim' 

" vim-xcode: partial Xcode support
Plug 'gfontenot/vim-xcode'

" fugitive: an awesome Git wrapper
Plug 'tpope/vim-fugitive'

" vim-slim: slim syntax highlighting for VIM
Plug 'slim-template/vim-slim'

" vim-arduino: vim plugin for compiling and uploading arduino sketches
Plug 'stevearc/vim-arduino'

call plug#end()

" EMMET PLUGIN SETTINGS
" let g:user_emmet_leader_key='<C-Z>'		" remap the leader to Ctrl-z

" Apply Arduino syntax to the correct files
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" RESOURCES
" https://dougblack.io/words/a-good-vimrc.html

" COLORS
syntax enable						" enable syntax processing
set background=dark			" choose the dark option of the solarized theme
colorscheme solarized		" use the solarized theme

" SPACES & TABS
set tabstop=2						" number of visual spaces per TAB
set softtabstop=2				" number of spaces in a tab while editing
set noexpandtab					" tabs are tabs, not spaces

" UI CONFIG
set number							" show line numbers
set cursorline					" highlight current line
set wildmenu						" visual autocomplete for the command menu
set lazyredraw					" redraw only when we need to
set showmatch						" highlight matching [{()}]
set noshowmode					" do not display the current mode as there is vim-airline

" LEADER SHORTCUTS
let mapleader=","				" leader is comma

" SEARCHING
set incsearch						" search as characters are entered
set hlsearch						" highlight matches
nnoremap <leader><space> :nohlsearch<CR>		" stop search highlighting map to ,<space>

" FOLDING
set foldenable					" enable folding

" MISC
set backspace=2

" Syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w = 1

let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']		" from swift.vim

" vim-airline configuration
set laststatus=2
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0

" vim-fastlane: Enable syntax highlighting for fastlane configuration files in
" vim
" https://github.com/milch/vim-fastlane
au BufNewFile,BufRead Appfile set ft=ruby
au BufNewFile,BufRead Deliverfile set ft=ruby
au BufNewFile,BufRead Fastfile set ft=ruby
au BufNewFile,BufRead Gymfile set ft=ruby
au BufNewFile,BufRead Matchfile set ft=ruby
au BufNewFile,BufRead Snapfile set ft=ruby
au BufNewFile,BufRead Scanfile set ft=ruby

" vim-arduino
let g:arduino_board = 'arduino:avr:mega2560'
let g:arduino_programmer = 'arduino:avrisp'
