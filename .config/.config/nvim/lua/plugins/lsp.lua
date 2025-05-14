return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
            },
          },
        },
      },
    },
  },
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-k>", mode = { "i" }, false }
  end,
}
