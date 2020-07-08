" set leader key to space
map <SPACE> <leader>

" LEADER Tab
nnoremap <silent><leader>` <C-^>

" LEADER f
nnoremap <silent><leader>ff :FZF<cr>
nnoremap <silent><leader>fs :w<cr>
nnoremap <silent><leader>fS :bufdo w<cr>
nnoremap <silent><leader>fed :e $MYVIMRC<cr>
nnoremap <silent><leader>feR :so $MYVIMRC<cr>
nnoremap <silent><leader>fT :NERDTreeFind<cr>

" LEADER b
nnoremap <silent><leader>bb :ls<cr>
nnoremap <silent><leader>bd :BD<cr>
nnoremap <silent><leader>bn :bnext<cr>
nnoremap <silent><leader>bp :bprevious<cr>
nnoremap <silent><leader>bR :e! %<cr>
nnoremap <silent><leader>bY gg"+yG

" LEADER p
nnoremap <silent><leader>pt :NERDTreeToggle<cr>
nnoremap <silent><leader>pf :FZF<cr>

" LEADER q
nnoremap <silent><leader>qq :qall<cr>

" LEADER t
nnoremap <silent><leader>tn :set invnumber<cr>

" LEADER s
nnoremap <silent><leader>sc :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><leader>sc

" MISC
nnoremap <leader>/ :lgrep  
