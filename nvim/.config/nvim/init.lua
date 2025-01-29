-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = "<Space>"

vim.opt.swapfile = false
vim.opt.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

require("config.lazy")
