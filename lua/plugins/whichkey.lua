return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		icons = {
			mappings = vim.g.have_nerd_font,
			keys = {},
		},
		spec = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>g", group = "[G]oto" },
			{ "<leader>w", group = "Git" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>e", group = "[E]xplore" },
		},
	},
}
