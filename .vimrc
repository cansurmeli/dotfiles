""""""""""
" VIM-PLUG
""""""""""
call plug#begin('~/.vim/plugged')
	" Emmet
	Plug 'mattn/emmet-vim'

	" NERD COMMENTER: Comment functions so powerful—no comment necessary.
	Plug 'scrooloose/nerdcommenter'

	" Syntastic: Syntax checking
	"Plug 'scrooloose/syntastic'

	" Ale: Asynchronous linting/fixing for Vim and Language Server Protocol(LSP) integration
	Plug 'w0rp/ale'

	" Vim-Airline: Lean & mean status/tabline for vim that's light as air.
	Plug 'bling/vim-airline'

	" CTRLP: Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
	Plug 'kien/ctrlp.vim'

	" Vim-Gitgutter: A Vim plugin which shows a git diff in the gutter(sign column) and stages/undoes hunks.
	Plug 'airblade/vim-gitgutter'

	" Vim-Pbxproj: Syntax highlighting for pbxproj files in Vim.
	Plug 'cfdrake/vim-pbxproj'

	" Tabular: Vim script for text filtering and alignment
	Plug 'godlygeek/tabular'

	" Clang Complete: A Vim plugin that use clang for completing C/C++ code.
	Plug 'rip-rip/clang_complete'

	" Vim Game: Snake
	Plug 'johngrib/vim-game-snake'
call plug#end()

"""""""""""
" RESOURCES
"""""""""""
" https://dougblack.io/words/a-good-vimrc.html
" http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
" https://github.com/milch/vim-fastlane
" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" https://www.cyberciti.biz/faq/vim-vi-text-editor-save-file-without-root-permission/

""""""""""""""""""""
" VIM'S OWN SETTINGS
""""""""""""""""""""
" GENERAL
set foldenable
syntax enable
let mapleader=","

" ENABLE OMNI-COMPLETION
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" SPACES & TABS
set tabstop=2						" number of visual spaces per TAB
set shiftwidth=2				" number of space characters inserted for indentation
set softtabstop=2				" number of spaces in a tab while editing
set noexpandtab					" tabs are tabs, not spaces

" SEARCHING
set incsearch						" search as characters are entered
set hlsearch						" highlight matches

" Stop search highlighting map to ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" UI CONFIG
set number         " show line numbers
set cursorline     " highlight current line
set wildmenu       " visual autocomplete for the command menu
set lazyredraw     " redraw only when we need to
set showmatch      " highlight matching [{()}]
set noshowmode     " do not display the current mode as there is vim-airline
set splitright
set backspace=2
set pumheight=20 " Limit popup menu height

" BUFFER MANAGEMENT
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>p :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" PARANTHESIS & BRACKETS
inoremap ( ()<Esc>i
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { []<Esc>:let leavechar="}"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

" OTHER
" force write a non-sudo opened file via `:w!!` (type in a fast manner)
cnoremap w! :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Use system clipboard as the default one
set clipboard=unnamed

" centralised swapfiles
set directory^=$HOME/.vim/swapfiles/

" Complete options (disable preview scratch window, longest removed away to show the menu)
set completeopt=menu,menuone

" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

""""""""""""""""
" CLANG COMPLETE
""""""""""""""""
let g:clang_library_path     = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:clang_snippets         = 1
let g:clang_conceal_snippets = 1
let g:clang_snippets_engine  = 'clang_complete'

"""""""
" EMMET
"""""""
" Redefine the trigger key
let g:user_emmet_leader_key            = '<C-E>'

" Enable just for html/css
let g:user_emmet_install_global        = 0
autocmd FileType html,css EmmetInstall

"""""""""
"FASTLANE
"""""""""
au   BufNewFile,BufRead   Appfile       set   ft = ruby
au   BufNewFile,BufRead   Deliverfile   set   ft = ruby
au   BufNewFile,BufRead   Fastfile      set   ft = ruby
au   BufNewFile,BufRead   Gymfile       set   ft = ruby
au   BufNewFile,BufRead   Matchfile     set   ft = ruby
au   BufNewFile,BufRead   Snapfile      set   ft = ruby
au   BufNewFile,BufRead   Scanfile      set   ft = ruby

"""""""""""""
" VIM-AIRLINE
"""""""""""""
set laststatus=2
let g:airline#extensions#branch#enabled   = 1
let g:airline#extensions#hunks#enabled    = 0
let g:airline#extensions#tabline#enabled  = 1    " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename for the buffers
