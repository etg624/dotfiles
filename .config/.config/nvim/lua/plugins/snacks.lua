return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      formatters = {

        file = {
          truncate = 1000,
        },
      },
      sources = {
        explorer = {
          sources = {
            files = {
              exclude = {
                ".git",
                ".DS_Store",
                "node_modules",
                "vendor",
                "__pycache__",
                ".venv",
              },
            },
          },

          hidden = true,
          layout = { layout = { position = "right" } },
          win = {
            list = {
              keys = {
                ["o"] = "confirm",
              },
            },
          },
        },
        files = { hidden = true, matcher = { frecency = true, history_bonus = true } },
      },
    },
  },
  keys = {

    { "<leader>sg", LazyVim.pick("live_grep", { root = false, hidden = true }), desc = "Grep (cwd)" },
    { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root dir)" },
    { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root dir)" },
    { "<C-p>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },

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
