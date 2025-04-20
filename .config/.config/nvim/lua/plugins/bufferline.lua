return {
  "akinsho/bufferline.nvim",
  dependencies = { "neanias/everforest-nvim" },
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    opts.options = {

      max_name_length = 35,
      persist_buffer_sort = false,
      sort_by = "insert_after_current",
      show_duplicate_prefix = true,
      show_buffer_close_icons = false,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    }
    local everforest = require("everforest")
    local colours = require("everforest.colours")
    local palette = colours.generate_palette(everforest.config, vim.o.background)
    opts.highlights = {
      buffer_selected = {
        fg = palette.purple,
      },
    }

    return opts
  end,
}
