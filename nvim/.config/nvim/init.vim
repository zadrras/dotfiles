" Plug settings
let plugpath='~/.config/nvim/bundle'

filetype plugin indent on
call plug#begin(plugpath)
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic', {'for': 'python'}
Plug 'airblade/vim-gitgutter'
Plug 'ambv/black'
call plug#end()

" Colorscheme
syntax on
colorscheme molokai

" Nicer command line completion
set wildmenu
set wildmode=longest:full,full

" Reopen files on same line as when closed
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exec "normal g'\"" | endif

" Sudo writing with w!!
cmap w!! %!sudo tee > /dev/null %

" Persistent undo
if has("persistent_undo")
    set undofile
    set undodir=~/.config/nvim/undo
    set undolevels=1000
    set undoreload=10000
endif

set lazyredraw " Do not show macro expansions visually
set showtabline=1 " Show tabs on top only if available
set laststatus=2 " Status bar always visible

set clipboard=unnamed " Use system clipboard
set clipboard+=unnamedplus

set encoding=utf-8
set nowrap " Do not wrap text, have to scroll to see it!
set nolinebreak " uhhh
set tabstop=4
set cursorline " Highlight line where cursor is
set shiftwidth=4 " Number of spaces per tab
set expandtab " Expand tabs to spaces
set smartindent " Smart indenting on new line
autocmd FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class
set autoindent " Copy indent from current line when starting new line
set scrolloff=5 " Keep cursor 5 lines from top or bottom when scrolling
set ttimeoutlen=50 " Don't pause after leaving insert mode

set ignorecase " Ignore case generally
set smartcase " Case-sensitive only when containing uppercase

set number " Show line number for each line
set showcmd " Show command in the last line of the screen
set ruler " Show line, column at the bottom

set showmatch " Show matching braces

set hlsearch " Highlight search

nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>

" Trailing whitespaces highlighting
highlight default link EndOfLineSpace ErrorMsg
match EndOfLineSpace / \+$/
autocmd InsertEnter * hi link EndOfLineSpace Normal
autocmd InsertLeave * hi link EndOfLineSpace ErrorMsg

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F4> :UndotreeToggle<CR>
nnoremap <C-l> :SyntasticCheck<CR>
nnoremap <C-a> :Black<CR>
let NERDTreeDirArrows=1
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

" File saving
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

" open splits below and right by default
set splitbelow
set splitright

" short startup message
set shortmess+=I

set nofoldenable

let t:is_transparent = 0
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=None ctermbg=NONE
function! Toggle_transparent()
    if t:is_transparent == 0
        hi NonText guibg=None ctermbg=NONE
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

" python-mode configs
let g:pymode_python = 'python3'

" YouCompleteMe settings
let g:ycm_confirm_extra_conf = 0

" Airline settings
let g:airline_theme='base16_monokai'

"syntastic settings
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_loc_list_height = 5
