-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.list = true
opt.listchars = {
  tab = "» ",
  space = "·",
}

vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#8da101" })
