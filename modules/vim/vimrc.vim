filetype  on

" General
set spelllang=en_us     " Speak proper english
set nocompatible        " Disable compatible mode to vi
set showmode            " Persistent notice of current mode
scriptencoding utf-8    " set character encoding
set encoding=utf-8      " same as above?
set number              " set line numbers on
set linebreak           " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set showmatch           " Highlight matching brace
set noshowcmd

" Advanced
set ruler		            " Show row and column ruler information

" showing whitespaces character and configure them
set list
set listchars=eol:$,tab:»·,trail:·

" enable syntax highlighting and colorscheme
" and some other special visualization modes
syntax on                           " set syntax highlighting on
colorscheme codedark                " set colorscheme to darkblue
set colorcolumn=100                 " sets a vertical column for orientation
set cursorline                      " highlight current line

"" set vim editor behavior in command mode
set wildmenu                        " visual autocomplete for command menu
set viminfo='25,f1,<250,:25,n~/.viminfo " store some info in ~/.viminfo

" Tabbing
set expandtab           " tabs are spaces
set tabstop=2           " tabs in files are four spaces
set softtabstop=2       " same as tabstop but for my one <TAB>
set tabstop=2           " The number of spaces a tab is
set shiftwidth=2        " Number of spaces to use in auto(indent)
set showtabline=2	      " Show tab bar
set expandtab           " Insert tabs as spaces
set smarttab		        " Enable smart-tabs

" indention
set autoindent
set smartindent

" Buffer Settings
" Opens new buffers below/right from current one
set splitbelow
set splitright

" search behavior
set incsearch           " search as characters are entered
set hlsearch            " highlight matches as you type
set wrapscan            " Wrap searches
set ignorecase          " Ignore search term case...
set smartcase           " ... unless term contains an uppercase character

" Stop search highlighting with keystroke ,<space>
nnoremap ,<space> :nohlsearch<CR>

set foldenable      " enable folding
set foldmethod=indent
set foldlevel=99

set undolevels=10000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"" Key mappings
" Map comma as additional meta char
let mapleader=","
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" Use keystroke jk instead of <esc>
inoremap jk <esc>
" Change Buffer in shorter way
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" Move lines
nnoremap <ESC>[1;5A :m .-2<CR>
nnoremap <ESC>[1;5B :m .+1<CR>
nnoremap <ESC>[1;5C :><CR>
nnoremap <ESC>[1;5D :<<CR>
vnoremap <ESC>[1;5A :m '<-2<CR>gv
vnoremap <ESC>[1;5B :m '>+1<CR>gv
vnoremap <ESC>[1;5C :><CR>gv
vnoremap <ESC>[1;5D :<<CR>gv
inoremap <ESC>[1;5A <Esc>:m .-2<CR>gi
inoremap <ESC>[1;5B <Esc>:m .+1<CR>gi
inoremap <ESC>[1;5C <Esc>:><CR>gi
inoremap <ESC>[1;5D <Esc>:<<CR>gi

" enable pastemode with F2 Key
" stops autoindent and copied it as it is
set pastetoggle=<F2>
" scroll line before the fifth line ending
set scrolloff=5

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
