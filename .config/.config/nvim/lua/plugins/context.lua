return {
  "nvim-treesitter/nvim-treesitter-context",

  opts = function()
    require("treesitter-context").setup({ max_lines = 4 })
  end,
}
