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
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = LazyVim.config.icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
      get_element_icon = function(opts)
        return LazyVim.config.icons.ft[opts.filetype]
      end,
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
