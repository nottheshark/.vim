"
" ~/.vim/vimrc
"

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax enable
colorscheme solarized
call togglebg#map('<F5>')

map <C-n> :NERDTreeToggle<CR>               " map Ctrl+n to open nerdtree
map <F6> :IndentLinesToggle<CR>             " enable indentLines toggle
nnoremap <leader><space> :nohlsearch<CR>    " toggle search highlighting

filetype indent on     " load filetype-specific indent files
filetype plugin on     " make sure plugins are enabled

augroup configgroup
  autocmd!
  autocmd BufNewFile,BufRead *.ejs set filetype=html
  autocmd FileType css set tabstop=2 shiftwidth=2
  autocmd FileType gitcommit set colorcolumn+=51 textwidth=72
  " https://csswizardry.com/2017/03/configuring-git-and-vim/#update-2017-04-09
  autocmd FileType html set tabstop=2 shiftwidth=2
  autocmd FileType ruby set tabstop=2 shiftwidth=2
augroup END

if !has('win32')
  let g:indentLine_char='░'             " change indentLine character
  set list                              " show <Tab> as ^I and end-of-line as $
  set listchars=tab:»-,trail:·,eol:¬    " list of strings used for list mode
  " https://csswizardry.com/2017/05/writing-tidy-code/#invisibles
endif

" OPTIONS "{{{
set autoindent         " automatically set the indent of a new line
set background=dark    " "dark" or "light"; the background color brightness
set backspace=indent,eol,start     " specifies what <BS>, CTRL-W, etc. can do in
                                   " Insert mode
set colorcolumn=+1     " columns to highlight
set conceallevel=0     " controls whether concealable text is hidden
set expandtab          " expand <Tab> to spaces in Insert mode
set foldenable         " set to display all folds open
set foldlevelstart=10  " value for 'foldlevel' when starting to edit a file
set foldmethod=indent  " folding type: "manual", "indent", "expr", "marker" or
                       " "syntax"
set hidden             " don't unload a buffer when no longer shown in a window
set history=200        " how many command lines are remembered
set hlsearch           " highlight all matches for the last used search pattern
set incsearch          " show match for partly typed search command
set lazyredraw         " don't redraw while executing macros
set modeline           " enable using settings from modelines when reading a
                       " file
set modelines=1        " number of lines to check for modelines
set nowrap             " turn off line wrap
set number             " show the line number for each line
set ruler              " show cursor position below each window
set scrolloff=5        " number of screen lines to show around the cursor
set shiftwidth=4       " number of spaces used for each step of (auto)indent
set showcmd            " show (partial) command keys in the status line
set smartindent        " do clever autoindenting
set tabstop=4          " number of spaces a <Tab> in the text stands for
set textwidth=80       " line length above which to break a line
set ttimeout           " allow timing out halfway into a key code
set ttimeoutlen=100    " time in msec for 'ttimeout'
set wildmenu           " command-line completion shows a list of matches
"}}}

" FUNCTIONS "{{{
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction
:noremap <Leader>w :call TrimWhitespace()<CR>
" https://vi.stackexchange.com/a/456

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
" https://vim.fandom.com/wiki/Switching_case_of_characters#Twiddle_case
"}}}

" vim: set foldlevel=0 foldmethod=marker:
