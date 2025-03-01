return {
  {
    "vimwiki/vimwiki",
    event = "BufEnter *.md",
    keys = { "<leader>ww", "<leader>wt" },
    init = function()
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_list = {
        {
          path = "~/vaults/Consciousness Cabin/",
          syntax = "markdown",
          ext = ".md", -- Use ".md" to match file extensions
        },
      }
      vim.g.vimwiki_ext2syntax = {}
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "vimwiki",
        callback = function()
          vim.bo.filetype = "markdown"
        end,
      })
      vim.g.vimwiki_ext2syntax = { [".md"] = "markdown" }
    end,
  },
  { "tools-life/taskwiki" },
}
