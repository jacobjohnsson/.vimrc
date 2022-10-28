" Vundle Stuff 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git' "
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'sonph/onehalf'
"Plugin 'sonph/onehalf.vim'
"Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
"Plugin 'tikhomirov/vim-glsl'
"Plugin 'derekwyatt/vim-scala'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'frazrepo/vim-rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'

" Sneak: The missing motion!
Plugin 'justinmk/vim-sneak'

" Adds a context header while editing.
Bundle 'wellle/context.vim'

" For Language Server
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'mattn/vim-lsp-settings'

" For autocomplete
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" Plugin 'Shougo/ddc.vim'
" Plugin 'shun/ddc-vim-lsp'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Helps force plugins to load correctly when it is turned back on below
filetype off

" let g:rainbow_active = 1

" Turn on syntax highlighting
syntax on

" For plugins to load correctly filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
" set number

" Use hybrid line numbers
" set number relativenumber

" Use auto toggled numbers
:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Add column highlighting on column 80.
set colorcolumn=80

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Fold column is nice, use it :D
set foldcolumn=0
set foldmethod=indent
set foldlevel=10
set foldnestmax=1

" Context variables:
let g:context_presenter = 'vim-popup'
let g:context_max_per_indent=5

" Last line
set showmode
set showcmd

" highlight current line
set cursorline

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Updates vim every 200 ms (for stuff like git-gutter)
set updatetime=200

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Remap Crtl - f to fuzzy finder.
nnoremap <C-f> :Files <ENTER>
nnoremap <C-g> :BLines <ENTER>

" Scroll without moving cursor
map <Down> <C-e>
map <Up> <C-y>

map gr "ay :vimgrep  **/*.{c,h} <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>"<C-R>a"
map gc :e  %<.

" Remap copy and paste to clipboard:
map <C-c> "+y
map <C-p> "+p

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Needed for airline?
set laststatus=2

" The following maps and scripts allows me to keep pressing '+' and '-' after
" Ctrl+W '+' and Ctrl+W '-'.
nmap <C-W>+ <C-W>+<SID>ws
nmap <C-W>- <C-W>-<SID>ws
nn <script> <SID>ws+ <C-W>+<SID>ws
nn <script> <SID>ws- <C-W>-<SID>ws
nmap <C-W>< <C-W><<SID>ws
nmap <C-W>> <C-W>><SID>ws
nn <script> <SID>ws< <C-W><<SID>ws
nn <script> <SID>ws> <C-W>><SID>ws
nmap <SID>ws <Nop>

" Should be used as :Diff in the interpreter
command Diff GitGutterDiffOrig
command CapitalComment :vimgrep /\/\*\s[A-Z]\C/ **/*.{c,h}
command WhiteSpace :vimgrep "\s$"" **/*.{c,h}

" Color scheme (terminal)
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" Gruvbox settings:
set background=dark
let g:airline_theme='bubblegum'
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

" Color groups for trailing white space and long lones
highlight TrailingWhiteSpace ctermbg=yellow guibg=yellow
highlight LongLines ctermbg=yellow guibg=yellow ctermfg=black

" It's really annoying that this only works for two groups. even with
" matchadd()
autocmd InsertLeave * match TrailingWhiteSpace /\s\+$/
autocmd InsertLeave * 2mat LongLines /\%>80v.\+/
