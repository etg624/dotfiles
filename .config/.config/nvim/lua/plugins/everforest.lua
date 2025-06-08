return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
      background = "hard",
      diagnostic_text_highlight = false,
      on_highlights = function(hl, c)
        hl.DiffText = { fg = c.none, bg = c.bg_yellow, sp = c.red }
        hl.DiagnosticUnderLineError = { fg = c.none, bg = c.none, undercurl = true, sp = c.red }
        hl.DiagnosticUnderlineWarn = { fg = c.none, bg = c.none, undercurl = true, sp = c.yellow }
        hl.DiagnosticUnderLineInfo = { fg = c.none, bg = c.none, undercurl = true }
        hl.DiagnosticUnderlineHint = { fg = c.none, bg = c.none, undercurl = true }
      end,
    })
  end,
}
