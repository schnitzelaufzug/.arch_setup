"filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'dense-analysis/ale'
Plugin 'APZelos/blamer.nvim'
"Plugin 'rking/ag.vim'
"Plugin 'skwp/greplace.vim'
"Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'joshdick/onedark.vim'
Plugin 'lumiliet/vim-twig'
Plugin 'ervandew/supertab'
Plugin 'tomlion/vim-solidity'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


