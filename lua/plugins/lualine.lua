return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local ll = require("lualine")
		ll.setup({
			options = {
				theme = "catppuccin",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_x = {},
			},
		})
	end,
}
