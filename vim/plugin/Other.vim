"""""""""
" OTHER "
"""""""""
" Force write a non-sudo opened file via `:w!!` (type in a fast manner)
"cnoremap w! :execute ':silent w !sudo tee % > /dev/null' | :edit!

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

" Basic curly braces completion
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Auto-populating 

