" Plugins

" execute pathogen#infect()

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'uiiaoo/java-syntax.vim'
" Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
    let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
    let g:surround_{char2nr('b')} = "**\r**"
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lervag/vimtex'
    let g:tex_conceal = ''
"    let g:tex_flavor='latex'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_subfile_start_local=1

Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsBackwardsForwardTrigger = '<s-tab>'

Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    let g:mkdp_refresh_slow = 1
    let g:mkdp_auto_close = 0
    " let g:mkdp_preview_options = {'disable_sync_scroll': 1}
    let g:mkdp_markdown_css = expand('~/.vim/plugged/markdown-preview.nvim/style.css')
    let g:mkdp_theme = 'light'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

call plug#end()

syntax on
colorscheme joyeuse
set nu
set relativenumber
set fillchars+=vert:\▏
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
filetype plugin indent on
set nohlsearch
set scrolloff=8
set incsearch
set ignorecase
set smartcase
set confirm
set history=1000
set showmatch
set showcmd
set nowrap
set wildmenu
set splitbelow splitright
set hidden
set foldcolumn=0
set signcolumn=no
set backspace=2
set undodir=~/.vim/undodir
set undofile
set laststatus=2
set colorcolumn=80
set conceallevel=0
set autoread
set wildignore+=*.class,*.pdf
set mouse=a

" Status line settings
set statusline=
set statusline+=\ %2n "Buffer number 2
set statusline+=\ \| "Seperator 2
set statusline+=\ %-51f "File path
set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ [
set statusline+=%{(&modified)?'':'\ '}\ %M
set statusline+=%{(&readonly)?'':'\ '}\ %R
set statusline+=]
set statusline+=[%04v] "Cursorcolumn

" Remaps and commands
let mapleader = " "
nnoremap O O<Esc>
nnoremap o o<Esc>
vnoremap <C-c> "*y
nmap <leader>sp :call <SID>SynStack()<CR>



" QF & Location list Mappings
nnoremap <leader>qf :bel cw<CR>
nnoremap <leader>ll :bel lw<CR>
nnoremap <leader>j :lnext <CR>
nnoremap <leader>k :lprev <CR>

" COC Mappings
inoremap <expr><c-j> pumvisible() ? '<c-n>' : '<c-j>'
inoremap <expr><c-k> pumvisible() ? '<c-p>' : '<c-k>'
inoremap <expr><c-l> pumvisible() ? '<c-y>' : '<c-l>'
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>cd :CocDiagnostics <CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Undotree Mappings
nnoremap <silent> <leader>ud :UndotreeToggle<CR>

" CSS Color Mappings
nmap <leader>tcc :call css_color#toggle()<CR>

" FZF Mappings
nnoremap <silent> <C-p> :ProjectFiles<cr>
nnoremap <silent> <leader>bs :Buffers<cr>

" Java Mappings
nnoremap <leader>ju :JUnitTest<space>
nnoremap <leader>jc :call Javac()<CR>
nnoremap <leader>jd :call JavaCloseBuf()<CR>

" Vimtex Mappings


" Vimrc Auto Commands
augroup AUTOCMD
    autocmd!
    autocmd User VimtexEventQuit call vimtex#latexmk#clean(0)
    autocmd BufWritePre * :call TrimWhiteSpace()
    autocmd Filetype tex,md,markdown setlocal colorcolumn=0
augroup END

augroup QUICKFIX
    autocmd!
    autocmd Filetype qf setlocal norelativenumber number nobuflisted colorcolumn=0
    autocmd Filetype qf call AdjustWindowHeight(3, 10)
    autocmd Filetype qf nnoremap <buffer> <leader>h :colder<CR>
    autocmd Filetype qf nnoremap <buffer> <leader>l :cnewer<CR>
augroup END

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Helper functions

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

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

function! CSExamMode()
    setlocal tabstop=2 shiftwidth=2 softtabstop=2
endfunc
