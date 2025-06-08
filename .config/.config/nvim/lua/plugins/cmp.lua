-- Docs: https://cmp.saghen.dev/

return {
  {
    "saghen/blink.cmp",
    dependencies = {},
    opts = {

      completion = {
        ghost_text = { enabled = false },
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = "none",
          ["<Tab>"] = { "show", "accept", "select_next" },
          ["<S-Tab>"] = { "show_and_insert", "select_prev" },

          ["<C-space>"] = { "show", "fallback" },

          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-l>"] = { "select_and_accept", "fallback" },

          ["<C-k>"] = { "select_prev", "fallback" },
          ["<Right>"] = { "select_and_accept", "fallback" },
          ["<C-e>"] = { "cancel" },
          ["<C-y>"] = { "accept_and_enter", "fallback" },
        },
        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" or type == "@" then
            return { "cmdline" }
          end
          return {}
        end,

        completion = {
          menu = { auto_show = true },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          cmdline = {
            min_keyword_length = function(ctx)
              -- when typing a command, only show when the keyword is 3 characters or longer
              if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                return 2
              end
              return 0
            end,
          },
        },
      },

      keymap = {
        preset = "default",
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-space>"] = { "show", "hide", "fallback" },
        ["<C-y>"] = { "select_and_accept", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        ["<C-l>"] = { "select_and_accept", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Tab>"] = {},
      },
    },
  },
}
