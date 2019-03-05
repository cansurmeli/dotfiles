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

	" Goyo: Distraction-free writing in Vim
	Plug 'junegunn/goyo.vim'

	" Limelight: Provides focus mode.
	Plug 'junegunn/limelight.vim'

	" vim-toml: Vim syntax for TOML
	Plug 'cespare/vim-toml'

	" typewriter: An iA Writer inspired theme.
	Plug 'logico-dev/typewriter'
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
" DON'T USE THE ARROW KEYS
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

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
set showmatch      " highlight matching [{()}]
set noshowmode     " do not display the current mode as there is vim-airline
set pumheight=20   " Limit popup menu height
set lazyredraw
set splitright
set backspace=2

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
inoremap { {}<Esc>:let leavechar="}"<CR>i
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
"let g:user_emmet_leader_key            = '<C-E>'

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

"""""""""""
" LIMELIGHT
"""""""""""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
n
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"o""""""""""""
" VIM-AIRLINE
"""""""""""""
set laststatus=2
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled=1    " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod=':t' " Show just the filename for the buffers

"""""""""""""
" LIMELIGHT
"""""""""""""
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" TYPEWRITER
" Set typewriter as colorscheme
"colorscheme typewriter

" Set typewriter airline theme
"let g:airline_theme = 'typewriter'
