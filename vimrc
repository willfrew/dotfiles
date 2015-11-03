" Load pathogen (plugin manager)
execute pathogen#infect()

syntax on
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

" Sets the 'leader' key to comma since it's close
let mapleader=","

" Highlight matching {[()]}
set showmatch

" Visual tab filename autocompletion
set wildmenu

" Dark grey line numbers
set number
hi LineNr ctermfg=darkgrey

" Don't redraw so much
set lazyredraw

" Realtime search & highlighting
set incsearch
set hlsearch
" ,<space> -> stop highlighting search results.
nnoremap <leader><space> :nohlsearch<CR>

" Force latex highlighting
let g:tex_flavor = "latex"
" Spellchecking for .tex files
autocmd FileType tex setlocal spell
