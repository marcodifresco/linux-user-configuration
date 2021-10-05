" General settings
set number		" Show line nubers
set laststatus=2	" Always display the statusline in all windows
set showtabline=2 "	" Always display the tabline, even if there is only one tab
set t_Co=256		" Set if term supports 256 colors

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
call plug#end()
