-- Main LSP Configuration
return {
	{
		-- `lazydev` configures Lua LSP for Neovim config, runtime, and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Basic, Default Nvim LSP Client configurations for various LSP servers
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require("mason").setup({})`
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful, minimalistic status updates for LSP / Notifier
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							winblend = 0,
						},
					},
				},
			},

			-- nvim-cmp srouce for neovim's builtin's LSP client
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Run when an LSP attaches to a particular buffer.
			-- Every time a new file is opened that is associated with an lsp
			-- (`main.go` -> `gopls` language server)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local km = vim.keymap
					local tscope = require("telescope.builtin")

					km.set(
						"n",
						"<leader>gd",
						tscope.lsp_definitions,
						{ desc = "[G]oto [D]efinition", buffer = event.buffer }
					)

					km.set(
						"n",
						"<leader>gr",
						tscope.lsp_references,
						{ desc = "[G]oto [R]eferences", buffer = event.buffer }
					)

					km.set(
						"n",
						"<leader>gi",
						tscope.lsp_implementations,
						{ desc = "[G]oto [I]mplentation", buffer = event.buffer }
					)

					km.set(
						{ "n", "x" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ desc = "[C]ode [A]action", buffer = event.buffer }
					)

					km.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame", buffer = event.buffer })
					-- TODO: Keymaps associated with LSP
					-- Goto Declaration
					-- Type Definition
				end,
			})

			-- LSP servers & clients are able to communicate to each other what
			-- features that they support.
			--
			-- Neovim doesn't support everything that is in the LSP specification
			-- Adding nvim-cmp, luasnip, etc. Neovim now has *more* capabilities
			-- We create new capabilities w/ nvim-vmp, and then broadcast that to
			-- the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Enable following language servers
			local servers = {
				lua_ls = {},
				stylua = {},
				bicep = {},
			}

			-- Ensure the servers & tools above are installed
			local ensure_installed = vim.tbl_keys(servers or {})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}

						-- Handles overriding only values explicitly passed
						-- by the server configuration above. Useful when
						-- disabling certain features of an LSP.
						-- Example: Turn off formatting for a certain LSP.

						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
				ensure_installed = {},
				automatic_installation = false,
			})
		end,
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path", --nvim-cmp source for FS paths
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					-- Back & Forth Scroll Docs
					["C-b"] = cmp.mapping.scroll_docs(-4),
					["C-f"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["C-e"] = cmp.mapping.abort(),
				}),
				sources = {
					{ name = "lazydev", group_index = 0 },
					{ name = "nvim_lsp" },
					{ name = "path" },
				},
			})
		end,
	},
}
