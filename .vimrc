" GENERAL SETTINGS
set number		" Show line numbers
set laststatus=2	" Always display the status line in all windows
set showtabline=2	" Always display the tab bar, even if there is only 1
set t_Co=256		" Set if term supports 256 colors
set wildmode=longest,list,full	"Enable auto completion
set encoding=utf-8	" UTF-8 Encoding
set splitbelow splitright	" Fix split windows positions
syntax on		" Enable syntax highlighting
filetype on		" Detect file type
autocmd FileType * setlocal formatoptions-=c formatoptions-=ri formatoptions-=o	" Disables automatic commenting on newline"
@setlocal spell spelllang=en	" English spell checker


" THEME
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1
highlight OverLength ctermbg=yellow ctermfg=black guibg=#592929
match OverLength /\%81v.\+/


" VIM PLUGINS
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()


" KEYBINDING
" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
