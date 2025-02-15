-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shorten vim.opt to opt
local opt = vim.opt

-- Make line numbers default
opt.number = true

-- Enable mouse mode, useful for resizing splits!
opt.mouse = 'a'

-- Add relative line numbers to help with jumping
opt.relativenumber = true

-- Show which line your is on
opt.cursorline = true

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or 1+ capital letters in search term
opt.ignorecase = true
opt.smartcase = true

-- Keep sign column on by default
opt.signcolumn = 'yes'

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Minimal number of screen lines to keep above & below the cursor.
opt.scrolloff = 10

-- Preview substitutions live, as typed!
opt.inccommand = 'split'

-- Enable auto write
opt.autowrite = true

-- Indent Configuration
opt.shiftwidth = 2 -- Size of an indent
opt.shiftround = true -- Round indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.expandtab = true -- All tabs are expanded via spaces

-- Disable show mode (Enable once statusline is up and running)
-- opt.showmode = false

-- Enable termguicolors
opt.termguicolors = true

-- Disable Showmode
opt.showmode = false

opt.updatetime = 50
opt.swapfile = false
opt.backup = false
