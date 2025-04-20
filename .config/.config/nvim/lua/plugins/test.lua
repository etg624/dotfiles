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
        env = { DJANGO_SETTINGS_MODULE = "portals.settings.local_test" },
        dap = { justMyCode = false },
        args = { "--keepdb" },
        runner = "django",
      },
    },
  },
}
