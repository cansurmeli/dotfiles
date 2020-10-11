if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.template
		autocmd BufNewFile *.html 0r ~/.vim/templates/html.template
		autocmd BufNewFile bike.md 0r ~/.vim/templates/bike-tour.template
		autocmd BufNewFile diary.md 0r ~/.vim/templates/diary.template
	augroup END
endif
