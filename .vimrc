" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" => Colors and Fonts
" Enable syntax highlighting
syntax enable
colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Tabs & spaces
set tabstop=2       " The width of a TAB is set to 2
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set ruler           "Enable limited line numbering
set showmatch

set autoread        "Reload files changed outside vim

set wrap            "Wrap lines
set linebreak       "Wrap lines at convenient points

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ===================== Search ======================
set hlsearch  " Highlight all search results

set title           "Set the terminal title

set visualbell      "make the bell visual
