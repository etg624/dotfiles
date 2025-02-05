return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dap_python = require("dap-python")
    dap_python.setup("python")
  end,
}
