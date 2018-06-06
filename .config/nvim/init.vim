" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'skywind3000/asyncrun.vim'

Plug 'w0rp/ale'

Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-surround', { 'tags': '*' }

Plug 'mhinz/vim-signify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

Plug 'scrooloose/nerdcommenter'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

Plug 'lilydjwg/fcitx.vim'

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
set mouse=a

" set <leader> to ,
let mapleader = ","

" search
set ignorecase
set smartcase

" colorscheme
set bg=dark
colorscheme gruvbox
" set nvim can transparent in terminal
"highlight Normal ctermbg=none

nnoremap <C-L> :nohls<Enter>
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <F2> :vs<Enter>:te ydcv <cword><Enter>i

" set no suffix and including '#include' file filetype to cpp
au BufRead,BufNewFile * if expand('%:t') !~ '\.' && join(getline(1, '$'), "\n") =~ '#include'| set ft=cpp | endif

" windows
set splitright
"set splitbelow

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
" CppEnhancedHighlight Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips/']
let g:UltiSnipsUsePythonVersion = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_RootMarkers = ['.git', '.ycm_extra_conf.py']
" use default enternal tool rg, insteal of using version control tool, to find
" files when not in git repo root directory, otherwise, use version control
" tool
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = "rg"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solve UltiSnips key conflict
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" config
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

" subcommand
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <M-CR> :Autoformat<CR>

let g:formatdef_uncrustify_c = '"uncrustify -q -c ~/.uncrustify.cfg -l C "'
let g:formatdef_uncrustify_cpp = '"uncrustify -q -c ~/.uncrustify.cfg -l CPP "'
let g:formatters_c = ['uncrustify_c']
let g:formatters_cpp = ['uncrustify_cpp']

let g:formatdef_autopep8 = '"autopep8 --global-config ~/.flake8 - "'
let g:formatters_python = ['autopep8']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" linter list
let g:ale_open_list = 0

" trigger
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" quickfix window
let g:asyncrun_open = 10
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>

" build and run a single file
nnoremap <silent> <F5> :AsyncRun clang -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>
nnoremap <silent> <F4> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>
