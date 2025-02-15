return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs", -- Sets main module to use for opts
  opts = {
    ensure_installed = { "lua", "markdown", "markdown_inline", "vim", "vimdoc", "diff", "bash" },
    highlight = { 
      enable = true,
      additional_vim_regex_highlighting = { "ruby" }
    },
    indent = { 
      enable = true,
      disable = { 'ruby' }
    },
    autotag = { enable = true },
  }
}
