" Plugins

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'uiiaoo/java-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-highlightedyank'
Plug 'ajh17/vimcompletesme'
"Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
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
set fillchars+=vert:\▏
set noerrorbells
set vb
set t_vb=
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hlsearch
set scrolloff=7
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
set noshowmode
set foldcolumn=0
set directory^=$HOME/.vim/tmp//
set backspace=2


" Remaps and commands

map <space> /
nnoremap O O<Esc>
nnoremap o o<Esc>
nnoremap <silent> <esc><esc> :nohls<cr>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
map <F2> :NERDTreeToggle<CR>
nmap <leader>sp :call <SID>SynStack()<CR>
nmap <leader>tcc :call css_color#toggle()<CR>

" Helper functions
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



" Scripts to run at the beginning
