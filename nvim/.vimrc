set autoindent 
let mapleader = " "
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
