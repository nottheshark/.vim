"
" ~/.vim/vimrc
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax enable
colorscheme solarized
call togglebg#map('<F5>')
map <C-n> :NERDTreeToggle<CR>    " map Ctrl+n to open nerdtree
filetype plugin on    " make sure plugins are enabled
map <F6> :IndentLinesToggle<CR>    " enable indentLines toggle
if !has('win32')
    let g:indentLine_char='░'    " change indentLine character
endif
