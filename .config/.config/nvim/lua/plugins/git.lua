return {
  { "sindrets/diffview.nvim", opts = {} },
  {
    "akinsho/git-conflict.nvim",
    version = "v2.1.0",
    config = true,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "folke/snacks.nvim", -- optional
    },
    opts = {
      kind = "floating",
      floating = {
        relative = "editor",
        width = 0.9,
        height = 0.7,
        style = "minimal",
        border = "rounded",
      },
    },
    config = true,
    keys = {
      {
        "<leader>gn",
        ":Neogit<CR>",
        desc = "Open Neogit",
      },
      {
        "<leader>gp",
        ":Neogit pull<CR>",
        desc = "Neogit pull",
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      gitbrowse = {
        opts = {
          what = "commit",
        },
      },
    },
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%m-%d-%Y",
      virtual_text_column = 1,
      max_commit_summary_length = 50,
      set_extmark_options = {
        priority = 100,
      },
    },
    config = function(_, opts)
      require("gitblame").setup(opts)

      -- Keymap for opening commit URL only if blame is active
      vim.keymap.set("n", "<leader>go", function()
        if require("gitblame").is_blame_text_available() then
          vim.cmd("GitBlameOpenCommitURL")
        else
          vim.notify("Git blame is not active!", vim.log.levels.WARN)
        end
      end, { desc = "Open commit URL (if blame is active)" })
    end,
  },
}
