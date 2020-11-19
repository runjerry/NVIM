set updatetime=500

" Neomake configs to make it a bit less annoying

" When writing a buffer.
" call neomake#configure#automake('w')
"" When writing a buffer, and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
"" When reading a buffer (after 1s), and when writing.
"call neomake#configure#automake('rw', 1000)
let g:neomake_open_list = 2

" Disable Python 2 support
let g:loaded_python_provider = 0

let g:coc_disable_startup_warning = 1

" Turn on line numbers
set nu
" Turn on syntax highlighting
syntax on
" It hides buffers instead of closing them.
" https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden
" Highlights search results as you type vs after you press Enter
set incsearch
" Ignore case when searching
set ignorecase
set smartcase 
" Turns search highlighting on
set hlsearch

filetype plugin indent on
" When indenting with '>', use 4 spaces width
set shiftwidth=4  
set smartindent
set autoindent
" Show existing tab with 4 spaces width
set tabstop=4
set smarttab
" Expands TABs into whitespaces
set expandtab

" Exclude these files from *
set wildignore=*.swp,*.bak,*.pyc,*.class
" Turn on TrueColor
" let $COLORTERM="truecolor"
set termguicolors
" set t_Co=256                            " Support 256 colors
" set background=dark                     " tell vim what the background color looks like

" Copy paste between vim and everything else"
" Needs the following mapping to work
" vnoremap <C-c> "*y
" nnoremap <C-c> "*Y
" nnoremap <C-p> "*p
set clipboard+=unnamedplus               
" set clipboard^=unnamed,unnamedplus

" Disable auto match paren
" let g:loaded_matchparen=1
hi MatchParen guifg=NONE guibg=lightred  

" Switch to last active tab
let g:lasttab = 1
" I really like tt for switching between recent tabs
nmap tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" I said write it!
cmap w!! w !sudo tee % >/dev/null

" Don't expland tabs for Go
autocmd BufRead,BufNewFile   *.go setlocal noexpandtab

" A bit of autopep8 config
let g:autopep8_disable_show_diff=1

"" This colorscheme mimics a default Atom colorscheme which I quite like
" colorscheme onedark
colorscheme monokai-phoenix 

" Underline current line
set cursorline
hi clear CursorLine
hi CursorLine cterm=underline gui=underline
