set foldenable
set foldlevelstart=10		" Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10			" Folds can be nested. Setting a max value protects you from too many folds.
set foldmethod=manual		" Defines the type of folding.

" Make the folds persistent in between
"augroup auto save folds
"autocmd!
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
