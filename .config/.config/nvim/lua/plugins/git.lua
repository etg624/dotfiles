return {

  {
    "akinsho/git-conflict.nvim",
    version = "v2.1.0",
    config = true,
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "ibhagwan/fzf-lua", -- optional
    },
    opts = function(_, opts)
      require("neogit").setup(vim.tbl_deep_extend("force", opts, { commit_editor = { kind = "floating" } }))
    end,
    config = true,
    keys = {
      {
        "<leader>gn",
        ":Neogit kind=floating<CR>",
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
    "f-person/git-blame.nvim",
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
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
