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
			{ "<leader>c", group = "[c]ode" },
			{ "<leader>g", group = "[g]o To" },
			{ "<leader>G", group = "[G]it" },
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>f", group = "[f]ormat" },
		},
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
