" set leader key to space
map <SPACE> <leader>

" LEADER Tab
nnoremap <silent><leader><Tab> :e #<cr>

" LEADER f
nnoremap <silent><leader>ff :CtrlP<cr>
nnoremap <silent><leader>fs :w<cr>
nnoremap <silent><leader>fS :bufdo w<cr>
nnoremap <silent><leader>fed :e $MYVIMRC<cr>
nnoremap <silent><leader>feR :so $MYVIMRC<cr>

nnoremap <silent><leader>qq :qa!<cr>

" LEADER b
nnoremap <silent><leader>bb :ls<cr>
nnoremap <silent><leader>bd :bdelete<cr>
nnoremap <silent><leader>bk :bdelete
nnoremap <silent><leader>bK :.+,$bdelete<cr>
nnoremap <silent><leader>be ggdG
nnoremap <silent><leader>bM <c-w>r
nnoremap <silent><leader>bn :bnext<cr>
nnoremap <silent><leader>bp :bprev<cr>
nnoremap <silent><leader>bR :e! %<cr>
nnoremap <silent><leader>bY gg"+yG
nnoremap <silent><leader>bw :setlocal readonly!<cr>

" LEADER q
nnoremap <silent><leader>qq :qall<cr>

" LEADER p
nnoremap <silent><leader>pt :NERDTreeToggle<cr>
nnoremap <silent><leader>pf :CtrlP<cr>
