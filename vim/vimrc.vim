" Leader
let mapleader = ','
let maplocalleader="\<Space>"
set t_Co=256
"""""""""
" Vundle
"""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

" list all plugins that you'd like to install here
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'mileszs/ack.vim' " search recursively in all the directories :Ack
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

""""""""""
" Vim-Plug
""""""""""
call plug#begin()
Plug 'mbbill/undotree'
Plug 'tpope/vim-eunuch' " Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs. Ej:  cs<h1>, ds'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search <leader>t
Plug 'OrangeT/vim-csharp'
Plug 'elixir-lang/vim-elixir'
Plug 'omnisharp/omnisharp-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-dispatch'
Plug 'vim-ruby/vim-ruby'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

let g:plug_window = "split new"

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='luna'
" let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
" NerdTree
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" Start nerdTree always
" autocmd vimenter * NERDTree

" FZF
"""""""""""""""""""""""""""""""""""""

let g:fzf_layout = { 'down': '~25%' }

nmap <silent> <leader>t :FZF<cr>

nmap <silent> <leader>b :buffers<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" GutenTags
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags__ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Undotree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Pathogen
execute pathogen#infect()

filetype plugin indent on

""""""""""
" Options
""""""""""

set background=dark
" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme flattened_dark
let g:solarized_termcolors=16
let g:solarized_termtrans = 1 " This gets rid of the grey background

" Indent
set autoindent
set shiftround

" Tabs
set expandtab       " Use spaces instead of tabs.
set shiftwidth=4    " Number of spaces to use for indent.
set softtabstop=4   " Number of spaces a tab counts for while editing.
set tabstop=4       " Number of spaces a tab counts for.
                    " Keep 'sw', 'sts' and 'ts' equal for sanity's sake.

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Editing
set history=10000
set autoread
set hidden
set nojoinspaces
set textwidth=0
set backspace=indent,eol,start

" Visual
syntax enable
set shortmess+=I
set number
set winwidth=84
set colorcolumn=81
set cursorline
set foldmethod=marker

" JavaScript Syntax
let g:javascript_plugin_flow = 1

" JavaScript libraries syntax
let g:used_javascript_libs = 'angularjs,angularui,angularuirouter'
" Status bar
set laststatus=2  " Always show a status bar for each window

" Mouse
set mouse=a

" Other behavior
set scrolloff=2
set splitbelow
set splitright
set wildmenu
set wildignore+=*.dSYM,.DS_Store,node_modules,*.o,*.obj,*.aux,*.toc,*.log,*.dvi,*.pdf,*.png,*.jpg,*.gif,*.d,tags

" Undo
set undodir=$HOME/.cache/vim/undo
set undofile
set nobackup
set nowritebackup
set noswapfile

"""""""
" Maps
"""""""

" Go to first character
noremap · ^

" Move through wrapped lines
noremap j gj
noremap k gk
inoremap jh <ESC>

" Disable Ex mode, use it to close buffers
nnoremap Q :bd<cr>
nnoremap <leader>q  :bp\|bd #<CR>

" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> :nohlsearch<cr>

" Stop highlighting search results
nnoremap <silent> <cr> :nohlsearch<cr>

" Cycle through buffers with tab
nnoremap <tab> :bn<cr>
nnoremap <S-tab> :bp<cr>

" Check for modified files
nnoremap <leader><leader> :checktime<cr>

"""""""""""""""
" Autocommands
"""""""""""""""

augroup misc
    autocmd!

    " Reset splits size when vim is resized
    autocmd VimResized * execute "normal! \<c-w>="

    " Remove trailing whitespace on write
    autocmd BufWritePre * call Strip()

    " Always parse file from the start
    autocmd BufEnter * syntax sync fromstart

    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \   execute "normal! zz" |
                \ endif
augroup END

augroup filetypes
    autocmd!

    autocmd Filetype tex setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
augroup END


"""""""
" Misc
"""""""

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name !=# '' && new_name !=# old_name
        execute ':saveas ' . new_name
        execute ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <leader>n :call RenameFile()<cr>

" Remove trailing whitespace
function! Strip()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" C-d to exit term mode
noremap <c-d> <c-\><c-n>


"""""""""
" Plugins
"""""""""

" Undotree
nnoremap <f5> :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle=1
let g:undotree_DiffAutoOpen=0


" Statusline
set statusline=
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
" set statusline+=[%{&sw},%{&sts},%{&ts}]    " indentation stuff
set statusline+=%=                           " right align
set statusline+=%v:%l\ of\ %L\ (%p%%)%<         " offset
set statusline+=%{gutentags#statusline()}

if has('nvim')
    nmap <BS> <C-W>h
endif

set completeopt=menu
