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

	" vim-markdown-toc
	Plug 'mzlogin/vim-markdown-toc'

	Plug 'vim-scripts/hlint'
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
"""""""""""
" GENERAL "
"""""""""""
set foldenable
let mapleader=","
set hidden
set nocompatible				" Use Vim settings, rather than Vi settings
set confirm							" Display a confirmation dialog when closing an unsaved file
set clipboard=unnamed		" use the system clipboard

""""""""""""""""""
" TEXT RENDERING "
""""""""""""""""""
set encoding=utf-8
set linebreak
set scrolloff=3
set sidescrolloff=5
syntax enable

"""""""""
" NETRW "
"""""""""
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_winsize = 20

""""""""""""""""""""""""""
" ENABLE OMNI-COMPLETION "
""""""""""""""""""""""""""
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""
" SPACES & TABS "
"""""""""""""""""
set tabstop=2						" number of visual spaces per TAB
set shiftwidth=2				" number of space characters inserted for indentation
set softtabstop=2				" number of spaces in a tab while editing
set noexpandtab					" tabs are tabs, not spaces

"""""""""""""""
" DIRECTORIES "
"""""""""""""""
" Centralise the directories for the swap and backup files so they don't
" scatter around
set directory=$HOME/.vim/swp//
set backupdir=$HOME/.vim/backup//

"""""""""""""
" SEARCHING "
"""""""""""""
set incsearch						" find the next match as we type the search
set hlsearch						" highlight the searches by default
set ignorecase					" ignore case when searching
set smartcase						" unless a capital is types, the casing isn't ignored
" Stop search highlighting map to ,<space>
nnoremap <leader><space> :nohlsearch<CR>

"""""""""""""
" UI CONFIG "
"""""""""""""
set number         " show line numbers
set cursorline     " highlight current line
set wildmenu       " visual autocomplete for the command menu
set showmatch      " highlight matching [{()}]
set noshowmode     " do not display the current mode as there is vim-airline
set pumheight=20   " Limit popup menu height
set lazyredraw
set splitright
set backspace=2
set ruler								" always show the cursor position
set noerrorbells				" disable beep on errors
set visualbell					" flash the screen upon an error
set mouse=a

" Cursor Shape
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI.="\e[2 q" "SI = INSERT mode
let &t_SR.="\e[2 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"""""""""""""""""""""
" BUFFER MANAGEMENT "
"""""""""""""""""""""
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

"""""""""
" OTHER "
"""""""""
" Force write a non-sudo opened file via `:w!!` (type in a fast manner)
cnoremap w! :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Complete options (disable preview scratch window, longest removed away to show the menu)
set completeopt=menu,menuone

" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" Mastering Vim Quickly #43
" Easy git blame
command! -nargs=* Blame call s:GitBlame()

function! s:GitBlame()
    let cmd = "git blame -w " . bufname("%")
    let nline = line(".") + 1
    botright new
    execute "$read !" . cmd
    execute "normal " . nline . "gg"
    execute "set filetype=perl" 
endfunction

nnoremap <leader>gb :Blame

" Mastering Vim Quickly #45
" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Mastering Vim Quickly #67
autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

""""""""""""""""""
" CLANG COMPLETE "
""""""""""""""""""
let g:clang_library_path     = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:clang_snippets         = 1
let g:clang_conceal_snippets = 1
let g:clang_snippets_engine  = 'clang_complete'

"""""""""
" EMMET "
"""""""""
" Redefine the trigger key
"let g:user_emmet_leader_key            = '<C-E>'

" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"""""""""""
"FASTLANE "
"""""""""""
au   BufNewFile,BufRead   Appfile       set   ft = ruby
au   BufNewFile,BufRead   Deliverfile   set   ft = ruby
au   BufNewFile,BufRead   Fastfile      set   ft = ruby
au   BufNewFile,BufRead   Gymfile       set   ft = ruby
au   BufNewFile,BufRead   Matchfile     set   ft = ruby
au   BufNewFile,BufRead   Snapfile      set   ft = ruby
au   BufNewFile,BufRead   Scanfile      set   ft = ruby

"""""""""""""
" LIMELIGHT "
"""""""""""""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"""""""""""""""
" VIM-AIRLINE "
"""""""""""""""
set laststatus=2
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled=1    " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod=':t' " Show just the filename for the buffers
let g:airline#extension#ale#enabled = 1

"""""""""""""
" LIMELIGHT "
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

""""""""""""""
" TYPEWRITER "
""""""""""""""
" Set typewriter as colorscheme
"colorscheme typewriter

" Set typewriter airline theme
"let g:airline_theme = 'typewriter'

"""""""
" ALE "
"""""""
let b:ale_linters = {
			\'haskell': ['hlint', 'hdevtools'], 
			\'git': ['gitlint'],
			\'vim': ['vint'],
			\'swift': ['swiftlint'],
			\'matlab':['mlint']
			\}
let b:ale_fixers = {
			\'css': ['prettier'],
			\'haskell': ['hfmt']
			\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1			" lint only when defined, otherwise too many noise
