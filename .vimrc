" Plugins

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'uiiaoo/java-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
    let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
Plug 'machakann/vim-highlightedyank'
Plug 'ajh17/vimcompletesme'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
    let g:indentLine_char = '¦'

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_subfile_start_local=1
Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsBackwardsForwardTrigger = '<s-tab>'

Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'

Plug 'ycm-core/YouCompleteMe', { 'do' : './install.py' }
    let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-j>'
    let g:ycm_filetype_blacklist={}
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_always_populate_location_list = 1
    let g:ycm_auto_hover=''

Plug 'iamcco/markdown-preview.nvim'
    let g:mkdp_refresh_slow = 1
    let g:mkdp_auto_close = 0
    let g:mkdp_preview_options = {'disable_sync_scroll': 1}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

call plug#end()

syntax on
"set t_Co=256
"set background=dark
"colorscheme iceberg
"highlight Normal ctermbg=NONE
"highlight EndOfBuffer ctermbg=NONE
"highlight Visual ctermbg=Grey
"highlight MatchParen ctermbg=Blue
"set cursorline
"hi CursorLine ctermfg=None ctermbg=239 cterm=NONE
colorscheme joyeuse
set nu
set relativenumber
"hi LineNr ctermbg=None ctermfg=242 cterm=NONE
"hi CursorLineNr ctermbg=239 cterm=NONE
"highlight clear SignColumn
"hi jsFuncCall ctermfg=Red
"hi VertSplit ctermbg=NONE ctermfg=grey
"set shell=/usr/bin/zsh
"set shellcmdflag=-ic
set fillchars+=vert:\▏
set noerrorbells
set vb
set t_vb=
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on
set nohlsearch
set scrolloff=10
set incsearch
set smartcase
set linebreak
set ruler
set confirm
set history=1000
set showmatch
set wildmenu
set splitbelow splitright
set hidden
"set noshowmode
set foldcolumn=0
set signcolumn=no
set directory^=$HOME/.vim/tmp//
set backspace=2
set undodir=~/.vim/undodir
set undofile
set laststatus=2
set colorcolumn=80

set statusline=
set statusline+=\ %n "Buffer number
set statusline+=\ \| "Seperator
set statusline+=\ %f "File path
set statusline+=\ %h%m%r%w
set statusline+=[%4v] "Cursorcolumn

augroup colorcol
    autocmd!
    autocmd Filetype tex,md,markdown setlocal colorcolumn=0
augroup END

" Remaps and commands
let mapleader = " "
nnoremap O O<Esc>
nnoremap o o<Esc>
" nnoremap <silent> <esc><esc> :nohls<cr>

nnoremap <silent> <leader>ud :UndotreeToggle<CR>

" Split bindings
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l


nmap <leader>sp :call <SID>SynStack()<CR>
nmap <leader>tcc :call css_color#toggle()<CR>
vnoremap <C-c> "*y

" YCM Key bindings
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>


" FZF Key bindings
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <leader>bs :Buffers<cr>


" Helper functions
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunc

" Scripts to run at the beginning
augroup AUTOCMD
  autocmd!
  autocmd User VimtexEventQuit call vimtex#latexmk#clean(0)
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
