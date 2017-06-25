execute pathogen#infect()

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Use chapa.vim default mappings
let g:chapa_default_mappings = 1

set updatetime=250
let g:gitgutter_sign_column_always = 1

let g:molokai_original = 1
colorscheme molokai

"Show lines numbers"
set relativenumber
set number
set backspace=indent,eol,start
set laststatus=2

if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" <Esc> key for leaving insert mode is antiquated
noremap jj <ESC>

" ==================== Lightline ====================

" mode information is displayed in the statusline
set noshowmode

" configure statusline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'fugitive': 'LightLineFugitive',
      \ },
      \ }

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
