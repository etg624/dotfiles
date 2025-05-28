-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = "<Space>"

vim.opt.swapfile = false
vim.opt.autoread = true

require("config.lazy")
