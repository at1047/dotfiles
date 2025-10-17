return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- Add file
      vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)

      -- Toggle quick menu
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      -- Select files 1–4
      vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)

      -- Navigate previous & next buffers
      -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end,
  }
}
