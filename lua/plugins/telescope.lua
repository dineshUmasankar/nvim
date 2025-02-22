return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Async Lua Lib
	},
	keys = {
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "[F]ind [F]iles" },
		{ "<leader>fw", require("telescope.builtin").live_grep, desc = "[F]ind [W]ord" },
		{ "<leader>fd", require("telescope.builtin").diagnostics, desc = "[F]ind [D]iagnostics" },
		{ "<leader>wb", require("telescope.builtin").git_branches, desc = "Git [B]ranches" },
		{ "<leader>wc", require("telescope.builtin").git_commits, desc = "Git [C]ommits" },
		{ "<leader>ws", require("telescope.builtin").git_status, desc = "Git [S]tatus" },
	},
}
