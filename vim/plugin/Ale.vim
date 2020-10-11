let g:ale_linters = {
			\'haskell': ['hlint', 'hdevtools'], 
			\'git': ['gitlint'],
			\'vim': ['vint'],
			\'swift': ['/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp'],
			\'matlab':['mlint'],
			\'python':['flake8', 'pylint'],
			\'javascript':['eslint'],
			\'json':['eslint'],
			\'R':['lintr', 'styler'],
			\'yaml':['prettier'],
			\'sass':['sass-lint'],
			\'plaintex':['texlab'],
			\'java':['javac'],
			\'c': ['clang']
			\}
let g:ale_fixers = {
			\'css': ['prettier'],
			\'haskell': ['hfmt'],
			\'python': ['autopep8', 'yapf'],
			\'java': ['google_java_format'],
			\'c': ['clang-format'],
			\'javascript': ['eslint']
			\}
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:airline#extensions#ale#enabled = 1
" lint only when defined, otherwise too many noise
let g:ale_linters_explicit = 1
