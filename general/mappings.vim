" g Leader key
let mapleader=";"
" let localleader=" "
" nnoremap <Space> <Nop>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Buffer operations
" close buffer and left with previous one
nnoremap <Leader>q :bp<cr>:bd #<cr>
" binding buffer
nnoremap <Leader>b :Buffer<CR>
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

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" for inserting pdb
" command D :normal iimport pdb; pdb.set_trace()
imap <F9> import pdb; pdb.set_trace()

            " This is a quick way to call search-and-replace on a current word
            nnoremap \s :%s/\<<C-r><C-w>\>//g<Left><Left>
            " cc now hides those annoying search highlihghts after you're done searching
            nnoremap cc :let @/ = ""<cr>

" ap for a quick .py file formatting
nnoremap ap  :Autopep8<CR>

