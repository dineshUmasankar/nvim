return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = {}
    },
    spec = {
      { "<leader>f", group = "[F]ind" },
      { "<leader>g", group = "[G]it" },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
