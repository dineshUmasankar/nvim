local km = vim.keymap

-- TIP: Disable arrow keys in normal mode
km.set("n", "<left>", "<cmd>echo 'Use h to move!!'<CR>")
km.set("n", "<right>", "<cmd>echo 'Use l to move!!'<CR>")
km.set("n", "<up>", "<cmd>echo 'Use k to move!!'<CR>")
km.set("n", "<down>", "<cmd>echo 'Use j to move!!'<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
km.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Half Page Traversals with screen being centered
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
