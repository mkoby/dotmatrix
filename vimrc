filetype off
set nocompatible
set directory=/tmp/

call pathogen#runtime_append_all_bundles()
call pathogen#infect()

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 14
  else
    set guifont=Courier\ New:h18
  endif
endif

syntax enable

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme vividchalk
endif

filetype plugin indent on

set mouse=a
set number
set nowrap
set t_Co=256
set shiftwidth=2
set expandtab
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]\              " file format
set statusline+=%{fugitive#statusline()}
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set laststatus=2

let mapleader = "\\"
map <Leader>n :NERDTreeToggle<CR>
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>s :FufTag<CR>

runtime! macros/matchit.vim

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,eruby,yaml,cucumber set ai sw=2 sts=2 et
  autocmd BufWritePre <buffer> StripWhitespace
  autocmd FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4
augroup END

let g:rubytest_cmd_spec = "rspec -f p --no-color %p"
let g:rubytest_cmd_example = "rspec '%p:%c' --no-color"

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.yml :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.erb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.haml :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.rabl :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.css :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.rake :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre Gemfile :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre Guardfile :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre Guardfile.example :call <SID>StripTrailingWhitespaces()
