" Plugins
"
" lua require('treesitter')
" autocmd VimEnter * call s:setup_lua()
" function! s:setup_lua() abort
" lua<<EOF
" require('treesitter')
" EOF
" endfunction

call plug#begin("~/.config/nvim/plugged")
" Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'vim-python/python-syntax'
" Plug 'sheerun/vim-polyglot'
" Plug 'uiiaoo/java-syntax.vim'
" Plug 'ap/vim-css-color'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'navarasu/onedark.nvim'

Plug 'tpope/vim-surround'
    let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
    let g:surround_{char2nr('b')} = "**\r**"

Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
"  let g:webdevicons_enable_nerdtree = 1
  let g:webdevicons_conceal_nerdtree_brackets = 1

Plug 'ryanoasis/vim-devicons'


Plug 'lervag/vimtex'
    let g:tex_conceal = ''
"    let g:tex_flavor='latex'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_subfile_start_local=1

Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = 'c-`'
    let g:UltiSnipsJumpForwardTrigger = 'c-`'
"    let g:UltiSnipsBackwardsForwardTrigger = ''
Plug 'honza/vim-snippets'

Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    let g:mkdp_refresh_slow = 1
    let g:mkdp_auto_close = 0
    " let g:mkdp_preview_options = {'disable_sync_scroll': 1}
    let g:mkdp_markdown_css = expand('~/.vim/plugged/markdown-preview.nvim/style.css')
    let g:mkdp_theme = 'light'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'preservim/tagbar'
Plug 'weizheheng/nvim-workbench'

call plug#end()

syntax on
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme joyeuse
set nu
set relativenumber
set fillchars+=vert:\▏
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
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

nnoremap <Leader>pv :NERDTreeToggle <CR>

nnoremap <leader>lc :VimtexCompileSS<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>ts :TSHighlightCapturesUnderCursor<CR>

nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hu :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hr :lua require("harpoon.mark").rm_file()<CR>
nnoremap <leader>hg :lua require("harpoon.ui").nav_file(input())
" nnoremap <leader>hg :lua require("harpoon.ui").nav_file(input('Param: '))<CR>

nnoremap <leader>bp <Plug>ToggleProjectWorkbench
nnoremap <leader><CR> <Plug>WorkbenchToggleCheckbox

" nnoremap <leader>hm :lua require("harpoon.mark").add_file()

" QF & Location list Mappings
" nnoremap <leader>qf :bel cw<CR>
" nnoremap <leader>ll :bel lw<CR>
" nnoremap <leader>j :lnext <CR>
" nnoremap <leader>k :lprev <CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


nmap <F8> :TagbarToggle<CR>

" COC Mappings
inoremap <expr><c-j> pumvisible() ? '<c-n>' : '<c-j>'
inoremap <expr><c-k> pumvisible() ? '<c-p>' : '<c-k>'
inoremap <expr><c-l> pumvisible() ? '<c-y>' : '<c-l>'
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>cd :CocDiagnostics <CR>


nnoremap <leader>ls :ls<cr>:b

" Undotree Mappings
nnoremap <silent> <leader>ud :UndotreeToggle<CR>

" CSS Color Mappings
nmap <leader>tcc :call css_color#toggle()<CR>

" Java Mappings
" nnoremap <leader>ju :JUnitTest<space>
" nnoremap <leader>jc :call Javac()<CR>
" nnoremap <leader>jd :call JavaCloseBuf()<CR>

" function! Open() abort
"     let float = float#create()
"         " \.name('register')
"         \.as_scratch()
"         \.height(3)
"         \.width(0.8)
"         \.center()
"         \.open()
"
"     call float.write(0, ['testing', 'testing2'])
" endfunc

let NERDTreeQuitOnOpen = 1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Ignore errors
function Null(error, response) abort
endfunction

augroup hover
	autocmd!
	autocmd CursorHold * if !coc#float#has_float()
        \| if mode() == 'i'
            \| call CocActionAsync('doHover', 'float', function('Null'))
            \| call CocActionAsync('highlight', function('Null'))
        \| endif
	\| endif
	autocmd CursorHoldI * if CocAction('ensureDocument')
		\|silent call CocActionAsync('showSignatureHelp', function('Null'))
	\| endif
augroup end

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
"
"
command Joy :e ~/Desktop/sandbox/joyeuse/colors/joyeuse.vim

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
