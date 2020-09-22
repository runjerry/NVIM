" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
 
" Airline is a plugin that makes the status line look fancier.
" It requires a custom font (with arrows), and is completely optional
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" A more convenient (than default) directory browser for Vim
Plug 'scrooloose/nerdtree'

" Auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Highlights new/mofified/deleted lines in the "gutter"
Plug 'airblade/vim-gitgutter'

" Later in the config I'll bind this plugin to "gc"
" Typing "gc" will comment out a block or line of code in any language
Plug 'tpope/vim-commentary'

" A Git plugin with a crazy useful command :GitBlame
" Don't wait, blame someone else!
Plug 'tpope/vim-fugitive'

" A collection of colorschemes. Doesn't include my favorite one though.
Plug 'flazz/vim-colorschemes'

" If you prefer Ctrl+h/j/k/l for navigating across vim/tmux splits,
" this plugin will integrate Vim and Tmux, so that you can seamlessly
" Jump across the border of a vim/tmux split
Plug 'christoomey/vim-tmux-navigator'

" This is the interesting one: it generates a Tmux config that makes
" a tmux status line look like a vim airline with an applied theme
Plug 'edkolev/tmuxline.vim'

" Fzf for ffffuzzzy search~
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Neomake for asynchronous linting and building
Plug 'neomake/neomake'

" A beautiful autopep8. Have it bound to "ap"
Plug 'tell-k/vim-autopep8'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" " Colorizer
" Plug 'norcalli/nvim-colorizer.lua'

" " Import sorter for Python
" Plug 'fisadev/vim-isort'

" This is a core plugin to support autocompletion for most of the things.
" This is also the messiest one, as it requires manual (and periodic) 
" invocation of the build script.
" Plug 'Valloric/YouCompleteMe'

" Autocompletion for Python
" Plug 'davidhalter/jedi-vim'

" AI powered autocompletion tools.
" Plug 'zxqfl/tabnine-vim'

" A wrapper around silversearcher-ag
" Plug 'rking/ag.vim'

" A Vim plugin for all things Go. Supports autocompletion,
" smart code navigation, linting, and much more
" Plug 'fatih/vim-go'

" Never got used to this one, but it allows for wrapping a piece of
" text into "", '', or custom tags
" Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

