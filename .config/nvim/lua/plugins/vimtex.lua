return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_compiler_latexmk = {
        continuous = 1,
        options = {
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
        },
      }

      local autocmd_group = vim.api.nvim_create_augroup("VimtexUserAutocmds", { clear = true })

      vim.api.nvim_create_autocmd("User", {
          pattern = "VimtexEventQuit",
          command = "VimtexClean",
          group = autocmd_group,
          desc = "Clean up latexmk files on VimTeX quit",
      })

    end
  }
}
