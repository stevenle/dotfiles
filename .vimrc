" Pathogen.
execute pathogen#infect()
filetype plugin indent on

set maxmem=536870912
" syntax on

" Ignore case of searches.
set ignorecase
set smartcase

" Smart indents.
set smartindent

" Highlight searches dynamically as pattern is typed.
set incsearch

" Force soft tabs.
set expandtab
set shiftwidth=2
set softtabstop=2
" Use 4 spaces for Python.
autocmd Filetype python setlocal shiftwidth=4
autocmd Filetype python setlocal softtabstop=4
" Use regular tabs for Go.
autocmd Filetype go setlocal noexpandtab
autocmd Filetype go setlocal nolist
autocmd Filetype go setlocal tabstop=2

" Highlight whitespace.
set list listchars=tab:\ \ ,trail:\
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" Strip trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Highlight lines over 80 chars.
" highlight OverLength ctermbg=red ctermfg=white guibg=#59292
" match OverLength /\%81v.\+/

" Toggle set paste.
set pastetoggle=<F3>

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Change leader to ','.
let mapleader = ','

" Check ~/.vim/skel/tmpl.* for new file template.
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tpl.%:e

" vim-go.
let g:go_template_autocreate = 0
