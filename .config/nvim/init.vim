function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'roxma/nvim-completion-manager', {'do': 'npm install'}
"Plug 'marijnh/tern_for_vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'raimondi/delimitmate'
Plug 'Chiel92/vim-autoformat'
" nvim plugs
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'mhartington/oceanic-next'
Plug 'neomake/neomake'

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }  " Requires cargo
"Plug 'w0rp/ale' "linter

call plug#end()

" Keyboard shorcuts
map <C-n> :NERDTreeToggle<CR>

" color scheme options
set number
set noswapfile
set encoding=utf-8
set clipboard=unnamedplus

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" " Change tab behavior
set shiftwidth=2
set tabstop=2
set softtabstop=2"

" " Neovim settings
set termguicolors
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" " To map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

" " Neomake
call neomake#configure#automake('rw', 1000)
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

" " ale
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

"set clipboard+=unnamedplus
