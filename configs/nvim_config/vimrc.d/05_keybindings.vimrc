" disable prior key mappings (split-term.vim)
"let g:split_term_disable_key_mappings

" map Leader key
let mapleader = "\\"

" remap <Esc>
inoremap <Leader>` <Esc>

" horizontal line insertion
map <Leader>p h============================================================= <Esc>

" remap navigation keys
" originally, k='up', j='down', h='left', and l='right'
noremap j h
noremap h i
noremap i k
noremap k j

" navigate around nvim lines
nnoremap <C-j> <C-W>h
nnoremap <C-i> <C-W>k
nnoremap <C-k> <C-W>j
nnoremap <C-l> <C-W>l

" window navigation
nnoremap <Leader>w< <C-w><
nnoremap <Leader>w> <C-w>>
nnoremap <Leader>w- <C-w>-
nnoremap <Leader>w+ <C-w>+
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wx :close<CR>

" remap <F6> to NERDTreeToggle
nnoremap <F6> :NERDTreeToggle<CR>
" remap <F5> to source init.vim
nnoremap <F5> :source $HOME/.config/nvim/init.vim

" CTRL-U in -- INSERT -- mode deletes a chunk of text. Use CTRL-G u to first
" break undo so that you can undo CTRL-U after inserting a line break
inoremap <C-U> <C-G>u<C-U>

" toggle relative line numbers
nnoremap <Leader>3 :set nu!<CR>

" remap number increment to C-s (in case C-a is used by tmux)
"nmap <C-s> <C-a>

" vim paste mode toggle (for indentation issues when pasting text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" folding
nmap <Leader>f zf%

" Plugin-specific keybindings

" -- autocomplete
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" -- ultisnips
" let g:UltiSnipsExpandTrigger="<TAB>"
" let g:UltiSnipsJumpForwardTrigger="<C-b>"
" let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" -- split-term.vim
map <Leader>th :Term
map <Leader>tv :VTerm
map <Leader>tt :TTerm
map <Leader>tid :echo b:terminal_job_id

" -- vim-slime
let g:slime_no_mappings=1
" noremap <Leader>f :call b:SlimeBlocksFunction()<cr>
" noremap <Leader>r :call b:SlimeBlocksFenced()<cr>
xmap <Leader>v <Plug>SlimeRegionSend
nmap <Leader>l <Plug>SlimeLineSend
nmap <Leader>s <Plug>SlimeConfig
nmap <Leader>b <Plug>SlimeParagraphSend
