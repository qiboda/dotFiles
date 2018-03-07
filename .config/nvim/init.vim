" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'} 

Plug 'Chiel92/vim-autoformat'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-surround', { 'tags': '*' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'

" Initialize plugin system
call plug#end()

" indent and tab
set cindent
set expandtab
set tabstop=4
set shiftwidth=4

" line number
set number
set relativenumber

" mouse
set mouse=n

" set <leader> to ,
let mapleader = ","

nnoremap <C-L> :nohls<Enter>
nnoremap <F2> :w<Enter>:te ydcv <cword><Enter>i

" set no suffix and including '#include' file filetype to cpp
au BufRead,BufNewFile * if expand('%:t') !~ '\.' && join(getline(1, '$'), "\n") =~ '#include'| set ft=cpp | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" terminal-emulator 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" to normal mode
tnoremap <Esc> <C-\><C-n>
" to simulate i_CTRL-R in terminal-mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" to use `ALT+{h,j,k,l}` to navigate windows from any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips/']
let g:UltiSnipsUsePythonVersion = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solve UltiSnips key conflict
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" config
let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" subcommand
nnoremap <leader>jt :YcmCompleter GoTo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :Autoformat<CR>

let g:formatdef_uncrustify_c = '"uncrustify -q -c ~/.uncrustify.cfg -l C "'
let g:formatdef_uncrustify_cpp = '"uncrustify -q -c ~/.uncrustify.cfg -l CPP "'
let g:formatters_c = ['uncrustify_c']
let g:formatters_cpp = ['uncrustify_cpp']
