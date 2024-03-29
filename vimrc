"" .vimrc

"*****************************************************************************
"" Plugins
"*****************************************************************************"
"call plug#begin('~/.vim/plugged')
"
"" Color scheme
"Plug 'morhetz/gruvbox'
"
"call plug#end()

"*****************************************************************************
"" Plugin setup
"*****************************************************************************"

"" Gruvbox
"set termguicolors
"let g:gruvbox_italic=1
"let g:gruvbox_bold=1
"let g:gruvbox_underline=1
"let g:gruvbox_undercurl=1
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_contrast_light='hard'
"colorscheme gruvbox


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
set relativenumber

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""
""" LinuxDays Vim Workshop

"" Disable backwards compatibility with vi
set nocompatible

"set backspace=[indent, eol, start];
"set backspace=indent

"set filetype=[dos,unix] " pri zlom nastaveni vidno ^M na konci riadkov

"set selection=[exclusive,inclusive] " set whether cursor is on character or
"between two chars

"" After pressing tab menu is shown
set wildmenu 

"" Ignore some file types
set wildignore= " *~,*.bak,*.log 

" cmd verbose set noncompatible?
" cmd verbose map <Space>?
"
" :g/tab/# " search text + lineno
" 
" set [ignorecase,smartcase]
"
" in cmd mode Ctrl+R Ctrl+W insert word on cursor to cmd mode e.g. in 
"
" history of search :hist s
" q/ additional box to search for previously searched patterns
" 
" :%s/\w*/(&)/ for vim challenge 1 i.e. surround word with brackets
"
" :.!date "insert result of a command to cursor
"
" :%!xxd " hexa editor
" :%!xxd -r  " revert from hexa
"
" :set list " display control chars
" :set display " display invisible chars
" :set display=uhex " display invisible chars in hexa
"
" :earlier {count} | {N}[s,m,h..] (history 5 sec,min,hour earlier)
" :later -"- inverse of earlier
"
" CTRL+R=pow(2,10)
" CTRL+R=0xfffff
" CTRL+R=range(1,10)
" CTRL+R=range(1,20,3) " by how much jump
"
" Select how visual mode should be entered
" set selectmode=[mouse,key,cmd][,]...
"
" set selection=[inclusive,exclusive,old]
"
" Substitute in vertical block ^V -- some \%V
"
" Highlight column / line e.g. when edditing some tabled 
" :set cursorcolumn
" :set cursorline
"
" Merging two charecters
" :set digraph
" Ctrl+K char1 char2 OR char1 <Backspace> char2
" :digraph " to show all digraphs
"
" Show code of char underneath the cursor
" ga
"

"" Allow selection when using Shift+<Arrow>
"set keymodel=

"" Allow movement to non character places
set virtualedit=block "" [insert, all, onemore - movement to end of the line]

"" Shop matching pair
set showmatch

"" Set pairs
"set matchpairs=(:),[:],{:},<:>



"*****************************************************************************
"" Visual Settings
"*****************************************************************************

set background=dark

syntax on
set ruler
set number

" Vertical rulers 80, 100
set textwidth=80
set colorcolumn=+1

set background=dark

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Use for showing non printable characters with
" :set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Remap <ESC>
"imap jj <Esc>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Copy/Paste/Cut
noremap <C-c> "+y<CR>
noremap <leader>p "+gP<CR>
noremap <C-x> "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Search for visual block
vnoremap // y/<C-R>"<CR>

"" Open current line on GitHub
"nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=8 shiftwidth=8 expandtab
autocmd FileType cpp setlocal tabstop=8 shiftwidth=8 expandtab
autocmd FileType cc setlocal tabstop=8 shiftwidth=8 expandtab

