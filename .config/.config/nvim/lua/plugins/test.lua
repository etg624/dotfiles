return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      ["neotest-vitest"] = {},

      ["neotest-python"] = {
        env = {
          DJANGO_SETTINGS_MODULE = "portals.settings.local_test",
          PORTALS_SQLITE_TEST_DB_NAME = "testdb-keepdb.sqlite3",
        },
        dap = { justMyCode = false },
        args = { "--keepdb", "--ds", "portals.settings.local_test" },
        runner = "django",
      },
    },
  },
}
