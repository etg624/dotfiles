return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
      background = "hard",
      on_highlights = function(hl, c)
        hl.DiffText = { fg = c.none, bg = c.bg_yellow, sp = c.red }
      end,
    })
  end,
}
