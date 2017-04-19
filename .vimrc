set nocompatible    " be iMproved, required for vundle
filetype off        " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins -------------------------
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'ervandew/supertab'

" /plugins ------------------------

call vundle#end()

filetype plugin indent on

syntax on
set t_Co=256
colorscheme distinguished
set background=dark

set number
set tabstop=2
set shiftwidth=2
set expandtab

" netrw config --------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Open netrw on startup
" augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
" /netrw config -------------------

" Save on double escape
map <Esc><Esc> :w<CR>
