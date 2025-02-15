return {
  { 
    "catppuccin/nvim", 
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
      integrations = {
        markdown = true,
        treesitter = true,
        which_key = true,
      }
    }
  },
}
