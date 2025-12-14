local km = vim.keymap
local files = require('mini.files')
local pick = require('mini.pick')

-- File Explorer
km.set('n', '<leader>e', files.open, { desc = "Explore Files" })

-- Find Operations

---- Find Files
local find_file = function()
    pick.builtin.files({ tool = 'git' })
end;
km.set('n', '<leader>ff', find_file, { desc = "Find File" })

---- Find by Word
km.set('n', '<leader>fw', pick.builtin.grep_live, { desc = "Find by Word" })

--- Find Buffer
km.set('n', '<leader>fb', pick.builtin.buffers, { desc = "Find Buffer" })

--- Go To Definition
km.set('n', '<leader>grd', vim.lsp.buf.definition, { desc = "Go to Definition" })
