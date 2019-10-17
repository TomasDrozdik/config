"" .vimrc

"*****************************************************************************
"" Plugins
"*****************************************************************************"
call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'morhetz/gruvbox'

" Intelisense
" need config
"Plug 'neoclide/coc.nvim'

call plug#end()

"*****************************************************************************
"" Plugin setup
"*****************************************************************************"

"" Gruvbox
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Indentation
set smartindent
set cindent

"" Line numbers
set number
cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cc setlocal tabstop=2 shiftwidth=2 expandtab

