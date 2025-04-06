return {
  { "dmmulroy/tsc.nvim", opts = {} },
  {
    "marilari88/twoslash-queries.nvim",
    event = "LspAttach",
    opts = {},
    config = function(_, opts)
      require("twoslash-queries").setup(opts)

      -- Attach to tsserver via LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "tsserver" then
            require("twoslash-queries").attach(client, args.buf)
          end
        end,
      })
    end,
  },
}
