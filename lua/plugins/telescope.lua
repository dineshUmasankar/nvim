return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Async Lua Lib
  },
  config = function()
    local builtin = require "telescope.builtin"
    
    local km = vim.keymap
    km.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    km.set("n", "<leader>fw", builtin.live_grep, { desc = "[F]ind [W]ords" })
  end
}
