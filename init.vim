"General editor settings
set tabstop=4
set nocompatible
set splitright
set splitbelow
set mouse=a
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
 
"keybindings for { completion, "jk" for escape, ctrl-a to select all
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
map <C-a> <esc>ggVG<CR>
set belloff=all
 
"Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/aarish/.config/template.cpp
 
"Compile and run
"Note that this line requires the build.sh script!
autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++17 % && ./a.out;<CR>
map <F3> :40vsp input.txt<CR> 
map <F4> :sp output.txt<CR>
 
"LaTeX settings
autocmd FileType tex :NoMatchParen
autocmd FileType tex :set tw=110
 
"Plugin setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
filetype plugin indent on
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:tex_flavor = 'latex'
let g:vimtex_motion_matchparen = 0
let g:vimtex_fold_manual = 1
let g:vimtex_matchparen_enabled = 0
 
"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
        augroup WSLYank
                    autocmd!
                            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
                                augroup END
                            endif
 
        au BufNewFile,BufRead *.tex
            \ set nocursorline |
            \ set nornu |
            \ set number |
            \ let g:loaded_matchparen=1 |
 
autocmd TextChanged,TextChangedI <buffer> silent write

augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 85 width
    autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
    set winwidth=85
    wincmd =
endfunction
