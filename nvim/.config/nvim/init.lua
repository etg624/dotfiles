-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = "<Space>"

vim.opt.swapfile = false
vim.opt.autoread = true

if vim.fn.has("nvim") == 1 and vim.fn.executable("nvr") == 1 then
  vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

require("config.lazy")
