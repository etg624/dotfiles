return {
  "kamykn/spelunker.vim",

  lazy = false, -- Load it immediately
  config = function()
    -- Enable real-time spell checking
    vim.g.spelunker_check_type = 2

    -- Spell check in comments and strings only
    vim.g.spelunker_highlight_type = 1

    -- Cache results to improve performance
    vim.g.spelunker_enable_cache = 1

    -- Enable spelunker.vim for specific filetypes
    vim.g.spelunker_spell_bad_group = "SpelunkerSpellBad"
    vim.g.spelunker_spell_bad_priority = 10

    -- Enable word completion suggestions
    vim.g.spelunker_enable_completion = 1

    -- Highlight misspelled words in CamelCase or snake_case variables
    vim.g.spelunker_complex_or_compound_word_check = 1
  end,
  dependencies = {
    "kamykn/popup-menu.nvim",
    init = function()
      vim.schedule(function()
        vim.cmd([[hi PmenuSel ctermfg=135 ctermbg=239 cterm=NONE guifg=#b26eff guibg=#4e4e4e gui=NONE]])
      end)
    end,
  },
}
