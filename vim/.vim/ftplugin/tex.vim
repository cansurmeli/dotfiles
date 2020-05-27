Goyo 60x70

function! s:goyo_enter()
	setlocal nonumber
	
	" Ensure :q to quit even when Goyo is active
	let g:quitting = 0
  let g:quitting_bang = 0

  autocmd QuitPre <buffer> let g:quitting = 1
  cabbrev <buffer> q! let g:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
	if g:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if g:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
