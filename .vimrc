set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set cino+=L0 
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:

inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
autocmd BufNewFile *.cpp 0r /home/aarish/.config/template.cpp
autocmd filetype cpp nnoremap <F10> :vertical terminal ++shell ++cols=40 g++ %:r.cpp  &&  ./a.out <CR>
map <F3> :30vsp input.txt<CR>
map <F4> ggVG"_dd<CR>
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'searleser97/cpbooster.vim'

call plug#end()

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
