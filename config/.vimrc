" map W to :w
command! W :w

" force minimum window width
set winwidth=110

" navigate by display lines
noremap j gj
noremap k gk

" switch splits easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" better searches
set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap <CR> :nohlsearch<cr>

" syntax highlighting
syntax on

set relativenumber
set number

" add col 80 highlight
highlight ColorColumn ctermbg=blue
set colorcolumn=81
