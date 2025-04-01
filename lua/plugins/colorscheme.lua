return {
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
			gitsigns = true,
			telescope = {
				enabled = true,
			},
			cmp = true,
			mason = true,
			fidget = true,
			neotree = true,
		},
	},
}
