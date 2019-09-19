" Use go imports to fmt Go code
let g:go_fmt_command = "goimports"

" Use gopls for definitions
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Do not show hard tabs when on Go
set nolist

au FileType go nmap <leader>mr <Plug>(go-run)
au FileType go nmap <leader>mb <Plug>(go-build)
au FileType go nmap <leader>mt <Plug>(go-test)
au FileType go nmap <leader>mc <Plug>(go-coverage-toggle)

" By default the mapping gd is enabled, which opens the target identifier in current buffer. You can also open the definition/declaration, in a new vertical, horizontal, or tab, for the word under your cursor:

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Show a list of interfaces which is implemented by the type under your cursor with <leader>s
au FileType go nmap <Leader>ms <Plug>(go-implements)

" highlight everything
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" show type information of thing under the cursor
let g:go_auto_type_info = 1
let g:go_updatetime = 3200
