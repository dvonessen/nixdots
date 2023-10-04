{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
    ];
    extraConfig = ''
    filetype  on

    scriptencoding utf-8                " set character encoding
    set encoding=utf-8                  " same as above?

    " showing whitespaces character and configure them
    set list
    set listchars=eol:$,tab:»·,trail:·

    " enable syntax highlighting and colorscheme
    " and some other special visualization modes
    syntax on                           " set syntax highlighting on
    set number                          " set line numbers on
    colorscheme darkblue                " set colorscheme to darkblue
    set colorcolumn=100                 " sets a vertical column for orientation
    set cursorline                      " highlight current line

    "" set vim editor behavior in command mode
    set wildmenu                        " visual autocomplete for command menu
    set viminfo='25,f1,<250,:25,n~/.viminfo " store some info in ~/.viminfo

    " set vim editor behavior in text mode
    set autoindent                      " use same indent in nextline as in previous one
    set expandtab                       " tabs are spaces
    set tabstop=4                       " tabs in files are four spaces
    set softtabstop=4                   " same as tabstop but for my one <TAB>

    " Buffer Settings
    " Opens new buffers below/right from current one
    set splitbelow
    set splitright

    " .yaml files
    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
    " .py files
    autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

    " search behavior
    set incsearch                       " search as characters are entered
    set hlsearch                        " highlight matches
    " Stop search highlighting with keystroke ,<space>
    nnoremap ,<space> :nohlsearch<CR>

    set foldenable      " enable folding
    set foldmethod=indent
    set foldlevel=99

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

    " return to last line, when opening a file again
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " ansible-vim config
    " unindent after two new lines appear
    let g:ansible_unindent_after_newline = 1

    " vim-airline config
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

    " Fold and show doctstring
    let g:SimpylFold_docstring_preview = 1

    augroup CursorLine
        au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au WinLeave * setlocal nocursorline
    augroup END
  '';
  };
}
