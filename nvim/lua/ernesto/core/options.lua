-- Default mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disabling built-in netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- Lines and numbers
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearence and UI
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.termguicolors = true

-- System behavior
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "cursor"
opt.swapfile = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
