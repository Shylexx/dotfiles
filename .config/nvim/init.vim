set nocompatible

call plug#begin()

Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Coc Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Coq Autocomplete + Snippets
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Autoformat
Plug 'Chiel92/vim-autoformat'

" Polyglot lang pack
Plug 'sheerun/vim-polyglot'

" Discord Rich Presence
Plug 'andweeb/presence.nvim'

" CSS Color Preview
Plug 'ap/vim-css-color'

" Rainbow Brackets
Plug 'frazrepo/vim-rainbow'

" Icons
Plug 'ryanoasis/vim-devicons'

" NERDTree file manager
Plug 'scrooloose/nerdtree'

" Typescript Syntax
Plug 'HerringtonDarkholme/yats.vim'

" CPP Highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Syntastic
Plug 'vim-syntastic/syntastic'

call plug#end()

colorscheme catppuccin

let g:python3_host_prog="/usr/bin/python3"

filetype plugin indent on
set tabstop=2
set noexpandtab
set softtabstop=2
set shiftwidth=2
set number

" Enable Rainbow Brackets
let g:rainbow_active = 1 

" Control+N for Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
" Ignore Node Modules folder in nerdtree
let g:NERDTreeIgnore = ['^node_modules$']

" Call NerdTreeFind if NERDTree is active, current window contains a
" modifiable file, and we're not in a vimdiff
"function! SyncTree()
"  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" Sync Open File with NERDTree
function! IsNERDTreeOpen()
  return exists("t:NERDTREEBufName") && (bufwinnrt:NERDTreeBufName) != -1)
endfunction

" Tab to complete and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Ctrl+Space to open completion
inoremap <silent><expr> <c-space> coc#refresh()

" Goto Keys
" gd definition
" gy type definition
" gi implementation
" gr references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" K to show documentation in preview
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Highlight symbl under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" F2 to rename current word
nmap <F2> <Plug>(coc-rename)

" Show Commands on Space+C
nnoremap <silent> <space>c : <C-u>CocList commands<cr>

" Coc Nvim Required Settings
"
" Tall Command area to display messages
set cmdheight=2

" Long update time is too much delay
set updatetime=300

" Dont pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=yes

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" C++ Syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight =1 

" Syntastic CPPlint
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


