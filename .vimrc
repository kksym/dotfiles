
if v:progname =~? "evim"
  finish
endif

set nocompatible

set backspace=indent,eol,start

call pathogen#infect('bundle')

set nobackup
set history=50
set ruler
set showcmd
set incsearch

map Q gq

inoremap <C-U> <C-G>u<C-U>

if &t_Co > 2 || has("gui_running")
  syntax on
endif

source ~/.vimrc-keymaps

if has("autocmd")
  filetype plugin indent on

  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=78

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent

endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

colorscheme sweyla327140

set nocp
filetype plugin on

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set guioptions+=m
set spelllang=en_GB
" set nowrap
set tabstop=4 shiftwidth=4
set expandtab

set wrap
set textwidth=80

let b:is_chicken = 1

au VimEnter * RainbowParenthesesToggle

au Bufread,BufNewFile *.as set filetype=actionscript

au Bufread,BufNewFile *.md set spl=en_gb spell

au Bufread,BufNewFile *.rcpu set filetype=ruby

set nocompatible
set lazyredraw
set ttyfast

set visualbell
set shm=atIWswxrnmlf
set ruler
set title
set titlestring=%f%(\ [%M]%)
set numberwidth=1
set report=2
set laststatus=2 		
set statusline=%f%r\ %y\%=[%l,%c][%p%%]
set showcmd
set showmode
set winminheight=0

set wildmenu
set wildignore=*.o,*.obj,*.pyc,*.swc,*.DS_STORE,*.bkp
set wildmode=list:longest

set showmatch
set matchpairs=(:),{:},[:],<:>

set smartindent
set smarttab
set expandtab
set shiftround
set nofoldenable

