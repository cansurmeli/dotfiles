set incsearch						" find the next match as we type the search
set hlsearch						" highlight the searches by default
set ignorecase					" ignore case when searching
set smartcase						" unless a capital is types, the casing isn't ignored
" Stop search highlighting map to ,<space>
nnoremap <leader><space> :nohlsearch<CR>
