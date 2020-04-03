set nocompatible			    " be iMproved, required
so ~/.vim/plugins.vim			" imports vundle plugin script

syntax enable

let mapleader = ','
set backspace=indent,eol,start


set noerrorbells				" both lines turn of error bell if you misstype 
set vb t_vb=



"----------------Visuals-------------"

"colorscheme atom-dark-256		" set colorscheme
"set t_CO=256					" forces terminal to use 256 colors
colorscheme onedark
set tabstop=4					" sets <tab> to 4
set softtabstop=4				" number of tabstops a tab will make or delete
set shiftwidth=4				" when indentin with '>', use 4 spaces width
set expandtab					" on pressing tab insert 4 spaces
set number
set relativenumber
set numberwidth=1
set cursorline					" higlights current line of curser
set wildmenu					" displays a graphical interface 
                                " for tabcompletes
"set listchars=tab:\|\ 
"set list
" Set grey bar after 80 characters
"set colorcolumn=80
"highlight ColorColumn ctermbg=lightgrey

" Changes splitborder color to bg color"
"hi vertsplit guifg=bg guibg=bg			" this line does it in guivim
"hi vertsplit ctermfg=bg ctermbg=bg		" this line does it for terminal vim

"----------------Search-------------"

set hlsearch					"higlights search results
set incsearch					"higlights search results while typing

"----------------Split-Management-------------"

"sets split to below and right
set splitbelow
set splitright

"mapps controlkey + vimmovement key to the wiered split movements
nmap <c-j> <c-w><c-j>				
nmap <c-k> <c-w><c-k>				
nmap <c-l> <c-w><c-l>				
nmap <c-h> <c-w><c-h>				

"----------------Mappings-------------"

"Make it easy to edit the .vimrc file"
nmap <leader>ev :tabedit ~/.dotfiles/.vim/.vimrc<cr>

"add simple Higlight removal."
nmap <leader><space> :nohlsearch<cr>

"mapping jk to esc to exit insert mode
imap jk <esc>

"nnoremap <C-p> :CtrlP<cr>

"----------------Plugins--------------"

" CtrlP
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:15,result:15'
let g:ctrlp_custom_ignore = 'vendor\|git'

" Greplace.vim
set grepprg=ag											" We want to use Ag for search and Replace
let g:grep_cmd_opts = '--line-numbers --noheading'


"----------------netrw----------------"
"let g:netrw_liststyle = 3                               " changes the look to tree style
"let g:netrw_browse_split = 2                            " opens new files in new vertical split
"let g:netrw_winsize = 30                                " if netrw is opend it takes up 30% of space on display 

"----------------Split-Windows-----------"
set noea                                                " set no equalise allways so if you close window, windows don't resize stupidly


"----------------Auto-Commands------------"

"Autosource the .vimrc file on save"
augroup autosourceing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
