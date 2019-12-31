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
