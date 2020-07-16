set relativenumber " show relative line numbers
set number				 " also show the static line number for the current line while there
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
set mouse=							" disable any and all mouse interactions

"set cursorline     " highlight current line
" Highlight the current line with style
hi CursorLine cterm=BOLD ctermbg=DarkBlue ctermfg=white guibg=darkred guifg=white

" Disabling the arrow keys in every mode
" Make use of Vim instead! :]
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" provide `hjkl` movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" Cursor Shape
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI.="\e[2 q" "SI = INSERT mode
let &t_SR.="\e[2 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
