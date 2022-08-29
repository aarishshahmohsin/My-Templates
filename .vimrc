set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set autoindent
set background=dark
set smartindent
set selection=exclusive
set ruler
set showcmd
set incsearch
set number
set cino+=L0 
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
autocmd BufNewFile *.cpp 0r /home/aarish/.config/template.cpp
nnoremap <C-b> :vertical terminal ++shell ++cols=30 g++ %:r.cpp -o %:r  &&  ./%:r <CR>
nnoremap <C-c> "+y
nnoremap <C-v> "+p
autocmd VimLeave *.cpp !rm in rm %:r
map <F3> :30vsp in<CR>
map <F4> ggVG"_dd<CR>
colorscheme slate

let &t_SI = "\e[2 q"
let &t_EI = "\e[2 q"

augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
