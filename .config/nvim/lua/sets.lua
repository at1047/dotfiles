-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- UI / appearance
vim.opt.fillchars:append { vert = "▏" }
vim.opt.errorbells = false
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "no"
vim.opt.foldcolumn = "0"
vim.opt.colorcolumn = "80"
vim.opt.conceallevel = 0
vim.opt.mouse = "a"
vim.opt.laststatus = 2

-- Tabs and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Filetype plugins
vim.cmd("filetype plugin indent on")

-- History and buffers
vim.opt.confirm = true
vim.opt.history = 1000
vim.opt.hidden = true
vim.opt.scrolloff = 8
vim.opt.backspace = "2"
vim.opt.autoread = true

-- Undo settings
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

-- Wildmenu and ignores
vim.opt.wildmenu = true
vim.opt.wildignore:append { "*.class", "*.pdf" }

-- Status line
vim.opt.statusline = ""
vim.opt.statusline = vim.opt.statusline
  + " %2n"                   -- Buffer number
  + " |"                     -- Separator
  + " %-51f"                 -- File path
  + "          ["            -- Brackets
  + "%{(&modified)?'':' '} %M"
  + "%{(&readonly)?'':' '} %R"
  + "]"
  + "[%04v]"                 -- Cursor column

