return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Async Lua Lib
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "[F]ind [W]ord",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>wb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Git [B]ranches",
		},
		{
			"<leader>wc",
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "Git [C]ommits",
		},
		{
			"<leader>ws",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Git [S]tatus",
		},
	},
}
