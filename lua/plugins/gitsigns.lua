-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local km = vim.keymap

			km.set("n", "<leader>GB", gitsigns.blame, { desc = "[G]it [B]lame", buffer = bufnr })
		end,
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
}
