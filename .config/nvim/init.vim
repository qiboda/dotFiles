" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'w0rp/ale'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'jsfaint/gen_tags.vim'

Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'sbdchd/neoformat'
Plug 'Yggdroot/indentLine'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-surround', { 'tags': '*' }
Plug 'jiangmiao/auto-pairs'

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

Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

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

" paren
let loaded_matchparen=1

" mouse
set mouse=a

" set <leader> to ,
let mapleader = ","

" search
set ignorecase
set smartcase

" colorscheme
set bg=dark
"colorscheme gruvbox
colorscheme molokai
" set nvim can transparent in terminal
highlight Normal ctermbg=none

nnoremap <C-L> :nohls<Enter>
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <F2> :vs<Enter>:te ydcv <cword><Enter>i

" set no suffix and including '#include' file filetype to cpp
au BufRead,BufNewFile * if expand('%:t') !~ '\.' && join(getline(1, '$'), "\n") =~ '#include'| set ft=cpp | endif

" windows
set splitright
"set splitbelow

" Folding
"set foldmethod=indent

" encoding
set encoding=utf-8 " The encoding displayed.
set fileencoding=utf-8 " The edcoding written to file.

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
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips/']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir=$HOME.'/.config/nvim/UltiSnips/'

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
let g:Lf_ShowHidden = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}

function! Alternative()
    let name = expand("%:t:r")
    let extension = expand("%:e")
    let mapping = {"h": "cpp", "cpp": "h"}
    return name . '.' . get(mapping, extension, "")
endfunction


noremap <silent> ga :<C-U><C-R>=printf("Leaderf file --input %s", Alternative())<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solve UltiSnips key conflict
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_select_completion = ['<C-N>']
let g:ycm_key_list_previous_completion = ['<C-P>']
"
" config
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = $HOME.'/.config/nvim/.ycm_extra_conf.py'
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
" neoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <M-CR> :Neoformat<CR>

au BufWrite *.cpp,*.h,*.hpp,*.c :Neoformat

let g:neoformat_cpp_uncrustify = {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-c ~/.uncrustify.cfg', '-l CPP', '--replace'],
        \ 'stdin': 0,
        \ 'stderr': 1,
        \ 'replace': 1,
        \ }
let g:neoformat_enabled_c = ['uncrustify']
let g:neoformat_enabled_cpp = ['uncrustify']

let g:neoformat_python_autopep8 = {
        \ 'exe': 'autopep8',
        \ 'args': ['-s 4', '-E'],
        \ 'replace': 1,
        \ 'stdin': 1,
        \ 'valid_exit_codes': [0, 23],
        \ 'no_append': 1,
        \ }

let g:neoformat_enabled_python = ['autopep8']

" let g:neoformat_verbose = 1 " debug neoformat
" let &verbose = 1 " also increases verbosity of the editor as a whole 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" linter list
let g:ale_open_list = 0

" trigger
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:ale_linters = {'cpp': ['cppcheck']}
let g:ale_cpp_cppcheck_options = '--enable=style'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_fileTypeExclude = ['markdown']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gen_tags Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gen_tags#statusline = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDSpaceDelims = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lens Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lens#width_resize_max = 140
nnoremap <F12> :call lens#run()<CR>
