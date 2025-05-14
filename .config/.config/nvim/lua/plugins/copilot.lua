return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = "<C-y>",
        next = "<M-]>",
        prev = "<M-_>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      help = true,
    },
  },
}
