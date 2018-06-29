" set leader key to space
map <SPACE> <leader>

" LEADER Tab
nnoremap <silent><leader><Tab> <c-^>

" LEADER f
nnoremap <silent><leader>ff :FZF<cr>
nnoremap <silent><leader>fs :w<cr>
nnoremap <silent><leader>fS :bufdo w<cr>
nnoremap <silent><leader>fed :e $MYVIMRC<cr>
nnoremap <silent><leader>feR :so $MYVIMRC<cr>

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

" LEADER p
nnoremap <silent><leader>pt :NERDTreeToggle<cr>
nnoremap <silent><leader>pf :FZF<cr>

" LEADER q
nnoremap <silent><leader>qq :qall<cr>

" LEADER s
nnoremap <silent><leader>sc :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><leader>sc

" LEADER t
nnoremap <silent><leader>tc :tabnew<cr>
nnoremap <silent><leader>td :tabclose<cr>
nnoremap <silent><leader>tn :tabnext<cr>
nnoremap <silent><leader>tp :tabprevious<cr>

" MISC
nnoremap <leader>/ :Ack!  
