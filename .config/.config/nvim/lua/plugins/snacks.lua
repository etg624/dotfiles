return {
  "folke/snacks.nvim",
  opts = {
    picker = {

      sources = {
        explorer = {
          hidden = true,
          layout = { layout = { position = "right" } },
        },
        files = { hidden = true, matcher = { frecency = true, history_bonus = true } },
      },
    },
  },
  keys = {
    {
      "<leader>s/",
      function()
        local snacks = require("snacks")
        snacks.picker.search_history({
          name = "search",
          layout = {

            layout = {
              position = "bottom",
              backdrop = false,
              border = "top",
              height = 0.2,
            },
          },
        })
      end,
      desc = "Search History",
      mode = "n", -- Ensures it's only mapped in normal mode
    },
  },
}
