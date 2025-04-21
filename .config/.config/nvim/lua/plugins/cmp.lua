return {
  {
    "saghen/blink.cmp",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = {

      keymap = {
        preset = "enter",
        ["<C-k>"] = { "select_prev", "select_prev" },
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        ["<C-p>"] = {},
        ["<C-n>"] = {},
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
      completion = {
        menu = { direction_priority = { "n", "s" } },
      },
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            kind = "Copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
