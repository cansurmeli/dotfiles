" Retrieve the file name & write it as title
"let fileNameWithExtension = expand('%:t')
"let fileName = expand('%:t:r')
"let data = readfile(fileNameWithExtension)
"if writefile(data, fileNameWithExtension)
	"echomsg 'hello'
"endif
"echomsg expand('%:t:r')
"writefile("", "hello")
"writefile("", "foocopy", "b")

" Stable stuff
let g:goyo_width = 60
let g:goyo_height = 70
let g:goyo_linenr = 1
Goyo
