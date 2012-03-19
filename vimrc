filetype off
set nocompatible
set directory=/tmp/

call pathogen#runtime_append_all_bundles()

syntax enable

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme pablo
endif

filetype plugin indent on

set mouse=a
set number
set nowrap
set t_Co=256
set shiftwidth=2
set expandtab

let mapleader = "\\"
map <Leader>n :NERDTreeToggle<CR>
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>s :FufTag<CR>

runtime! macros/matchit.vim


augroup myfiletypes
  autocmd!
  autocmd FileType ruby,eruby,yaml,cucumber set ai sw=2 sts=2 et
augroup END

