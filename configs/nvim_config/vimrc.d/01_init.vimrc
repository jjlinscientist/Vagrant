filetype plugin indent on

" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#custom#option={}
let g:deoplete#custom#option['javascript.jsx']=['file', 'ultisnips', 'ternjs']
let g:tern#command=['tern']
let g:tern#arguments=['--persistent']
let g:tern_request_timeout=1
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:deoplete#custom#option#jedi#enable_typeinfo=0
"let g:deoplete#custom#option#jedi#ignore_errors=0

" completion
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end

" split-term.vim
let g:split_term_default_shell="bash"

" vim-slime, vim-slimeblocks
" let g:slime_target="tmux"
" let g:slime_default_config = "vimtarget"
let g:slime_target="neovim"
let g:slime_paste_file = "$HOME/.slime_paste_file"
let g:slime_python_ipython=1
let g:SlimeBlocksVerbose=1
let g:slime_dont_ask_default=0
