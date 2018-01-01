set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'
Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'raimondi/delimitmate'
Plugin 'Chiel92/vim-autoformat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'suan/vim-instant-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'nanotech/jellybeans.vim'
"Plugin 'janko-m/vim-test'

call vundle#end()            
filetype plugin indent on    

" Keyboard shorcuts
map <C-n> :NERDTreeToggle<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_onw = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" color scheme options
syntax enable
colorscheme jellybeans
"colorscheme base16-default-dark
set background=dark

set number
set noswapfile
set encoding=utf-8
let g:airline_powerline_fonts = 1
let airline_theme='luna'
set laststatus=2
set ttimeoutlen=50
set t_Co=256
set clipboard=unnamedplus

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Change tab behavior
set shiftwidth=2
set tabstop=2
set softtabstop=2

" ycm configs
let g:ycm_autoclose_preview_window_after_insertion = 1
