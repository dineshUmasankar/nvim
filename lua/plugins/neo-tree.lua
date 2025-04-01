return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		enable_git_status = false,
		enable_diagnostics = false,
		default_component_configs = {
			-- Custom Icon Provider via mini.icons
			icon = {
				provider = function(icon, node)
					local text, hl
					local micon = require("mini.icons")
					if node.type == "file" then -- if it's a file, set the text/hl
						text, hl = micon.get("file", node.name)
					elseif node.type == "directory" then -- get directory icons
						text, hl = micon.get("directory", node.name)
						if node:is_expanded() then
							text = nil
						end
					end
					-- set the icon text/highlight only if it exists
					if text then
						icon.text = text
					end
					if hl then
						icon.highlight = hl
					end
				end,
			},
			kind_icon = {
				provider = function(icon, node)
					local micon = require("mini.icons")
					icon.text, icon.highlight = micon.get("lsp", node.extra.kind.name)
				end,
			},
		},
	},
	lazy = false,
}
