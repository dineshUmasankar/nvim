return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Async Lua Lib
	},
	config = function()
		local builtin = require("telescope.builtin")

		local km = vim.keymap
		km.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
		km.set("n", "<leader>sw", builtin.live_grep, { desc = "[s]earch [w]ords" })
		km.set("n", "<leader>Gb", builtin.git_branches, { desc = "[G]it [b]ranches" })
		km.set("n", "<leader>Gc", builtin.git_commits, { desc = "[G]it [c]ommits" })
		km.set("n", "<leader>Gs", builtin.git_status, { desc = "[G]it [s]tatus" })
	end,
}
