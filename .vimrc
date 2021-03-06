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
Plugin 'ap/vim-buftabline'
Plugin 'Chiel92/vim-autoformat'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'itmammoth/doorboy.vim'

" /plugins ------------------------

call vundle#end()

filetype plugin indent on

" buffer setup --------------------
set hidden
" show buffer numbers
let g:buftabline_numbers = 1
" show modified indicator
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
" /buffer setup -------------------

syntax on
set t_Co=256
colorscheme distinguished
set background=dark

set number
set tabstop=2
set shiftwidth=2
set expandtab

" netrw config --------------------
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" /netrw config -------------------

" statusline config ---------------
" http://stackoverflow.com/a/9121083
" always display status line
set laststatus=2

" switch colors based on mode
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=6 ctermbg=0
  elseif a:mode == 'r'
    hi statusline ctermfg=5 ctermbg=0
  else
    hi statusline ctermfg=1 ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=8 ctermbg=15

" default the statusline to green when entering vim
hi statusline ctermfg=8 ctermbg=15

" Formats the statusline
set statusline=%f                               " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}]                         " file format
set statusline+=%y                              " filetype
set statusline+=%h                              " help file flag
set statusline+=%m                              " modified flag
set statusline+=%r                              " read only flag
set statusline+=\ %=                            " align left
set statusline+=Line:%l/%L[%p%%]                " line X of Y [% of file]
set statusline+=\ Col:%c                        " current column
set statusline+=\ Buf:%n                        " buffer number
" /statusline config --------------

" ultisnips config ----------------
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-tab>"
" /ultisnips config ---------------

" keymappings ---------------------
" Save on double escape
map <Esc><Esc> :w<CR>
noremap <F3> :Autoformat<CR>
noremap <C-N> :bn<CR>
noremap <C-P> :bp<CR>
" /keymappings --------------------

" relative line numbers -----------
set rnu
set nu!

function! ToggleNumRel()
  if(&nu == 1)
    set rnu
    set nu!
  else
    set nu
    set rnu!
  endif
endfunc

command! ToggleNumRel
  \ call ToggleNumRel()

noremap <F2> :ToggleNumRel<CR>
" /relative line numbers ----------
