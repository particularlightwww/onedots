call plug#begin()
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete-clangx'
Plug 'vimwiki/vimwiki'
call plug#end()


" Use deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
" Lightline 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeStatusline = '%#NonText#'

