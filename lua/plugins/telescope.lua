return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Async Lua Lib
  },
  config = function()
    local builtin = require "telescope.builtin"

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
  end
}
