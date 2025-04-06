-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Autocommands for setting colorcolumn based on filetype

-- Set colorcolumn with a thin grey line based on filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "100"
    vim.cmd("highlight ColorColumn guibg=#414868") -- Same thin grey line
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    vim.opt_local.colorcolumn = "120"
    vim.cmd("highlight ColorColumn guibg=#414868")
  end,
})

-- Function to check if Deno LSP (denols) is active in the current buffer
-- local function is_deno_active(bufnr)
--   bufnr = bufnr or vim.api.nvim_get_current_buf()
--   for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
--     if client.name == "denols" then
--       return true
--     end
--   end
--   return false
-- end
--
-- -- Function to stop unwanted LSPs (vtsls, eslint) if denols is active
-- local function disable_conflicting_lsps()
--   local bufnr = vim.api.nvim_get_current_buf()
--   if is_deno_active(bufnr) then
--     for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
--       if client.name == "vtsls" then
--         vim.lsp.stop_client(client.id)
--         print("Stopped " .. client.name .. " because denols is active")
--       end
--     end
--   end
-- end
--
-- -- Automatically run this function when an LSP attaches
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client and client.name == "denols" then
--       disable_conflicting_lsps()
--     end
--   end,
-- })
