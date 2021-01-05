syntax on
syntax enable
set hlsearch
set number
set backspace=indent,eol,start
color ron

if has("vms")
	set nobackup " don't keep backup file if versioning
else
	set backup 
endif

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

set ruler
set cursorline

set showcmd

if has('mouse')
	set mouse=a
endif

" tabs
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent

" detect .md as markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Unix as standard filetype
set ffs=unix,dos,mac

" Always utf8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

set so=5 " scroll lines
set sidescrolloff=5
set lazyredraw

set magic " regex

set autoread

if &history < 1000
	set history=1000
endif
if &tabpagemax < 50
	set tabpagemax=50
endif
if !empty(&viminfo)
	set viminfo^=!
endif
"set sessionoptions-=options

" don't highlight underscores in markdown
autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown :syntax match markdownIgnore "_"

" clipboard
set clipboard=unnamedplus

set completeopt=longest,menuone,preview

" colorcolumn color
hi ColorColumn ctermbg=000000 guibg=000000
