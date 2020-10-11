let g:lsc_server_commands = {
 \  'swift': {
 \    'command': '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'c': {
 \    'command': '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'python': {
 \    'command': 'pyls',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'tex': {
 \    'command': 'texlab',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}

" https://bluz71.github.io/2019/10/16/lsp-in-vim-with-the-lsc-plugin.html
" The above is a nice blog post regarding setting up vim-lsc.
let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'FindCodeActions': 'ga',
 \  'Completion': 'omnifunc',
 \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'
