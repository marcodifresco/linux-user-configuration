" General settings
set number		" Show line numbers
set laststatus=2	" Always display the status line in all windows
set showtabline=2	" Always display the tab bar, even if there is only 1
set t_Co=256		" Set if term supports 256 colors

" Color if over 80th column
highlight OverLength ctermbg=yellow ctermfg=black guibg=#592929
match OverLength /\%81v.\+/

" Theme
let g:airline_theme='angr'	" From vim-airline

" Spell checking
setlocal spell spelllang=en

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'
	Plug 'ntpeters/vim-better-whitespace'
call plug#end()
