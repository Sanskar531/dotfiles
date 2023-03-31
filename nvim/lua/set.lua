-- Set highlight on search
vim.o.hlsearch = false
vim.o.wrap = false

vim.o.swapfile = false

vim.o.relativenumber = true;

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.scrolloff = 8;

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.netrw_banner = 0
