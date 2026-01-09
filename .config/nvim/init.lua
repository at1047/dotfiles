require("sets")
require("remap")
require("config.lazy")

-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme everforest")

-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme tokyonight")

-- vim.keymap.set('n', ',r', ':w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line(".")<CR> %<.pdf<CR>', {
--   desc = "Save and forward search with Skim",
--   silent = true,
-- })
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = {"*.md", "*.tex"},
	group = group,
	callback = function()
		vim.wo.wrap = true
	end,
})
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
	group = group,
	callback = function()
		vim.wo.wrap = false
	end,
})
