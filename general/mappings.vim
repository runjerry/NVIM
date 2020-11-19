" g Leader key
let mapleader=";"
" let localleader=" "
" nnoremap <Space> <Nop>

" I hate escape more than anything else
" inoremap jk <Esc>
" inoremap kj <Esc>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-w> :q!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better nav
nnoremap <C-u> <C-d>
nnoremap <C-e> <C-u>
" nnoremap <C-i> <C-u>
" nnoremap <C-u> <C-f>
nnoremap <C-d> <C-y>
nnoremap <C-y> <C-f>
nnoremap <C-f> <C-e>

" nnoremap <C-u> <C-d>
" nnoremap <C-u> <C-n>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
" vnoremap <C-d> <C-f>
vnoremap <C-d> <C-b>

" Better nav for omnicomplete
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")
inoremap <expr> <Down> ("\<C-n>")
inoremap <expr> <Up> ("\<C-p>")

" Buffer operations
" close buffer and left with previous one
nnoremap <Leader>w :bp<cr>:bd #<cr>
" binding buffer
nnoremap <Leader>j :Buffer<CR>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

 " <TAB>: completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better indenting
" vnoremap < <gv
" vnoremap > >gv
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" for inserting pdb
" command D :normal iimport pdb; pdb.set_trace()
imap <F9> import pdb; pdb.set_trace()

" This is a quick way to call search-and-replace on a current word
nnoremap \s :%s/\<<C-r><C-w>\>//g<Left><Left>
" cc now hides those annoying search highlihghts after you're done searching
nnoremap cc :let @/ = ""<cr>

" ap for a quick .py file formatting
nnoremap ap  :Autopep8<CR>

" execute terminal commands
nnoremap <Leader>e :!
nnoremap <Leader>G :Git<space>
