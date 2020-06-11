" Mastering Vim Quickly #99
" `ctrl-I` to auto-correct misspelled words
"inoremap u[s1z=`]au

hi clear SpellBad
hi SpellBad cterm=underline,bold
autocmd FileType latex,tex,md,markdown setlocal spell spelllang=en_gb
