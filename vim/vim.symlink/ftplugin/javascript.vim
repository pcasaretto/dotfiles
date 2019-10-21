let g:vim_jsx_pretty_highlight_close_tag = 1
hi link jsxCloseString Comment
hi link jsxOpenPunct jsxPunct

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
