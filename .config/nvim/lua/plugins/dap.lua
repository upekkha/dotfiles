return {
  {
    "rcarriga/nvim-dap-ui",
    -- Keep debugger ui open after execution finishes.
    -- https://github.com/rcarriga/nvim-dap-ui/issues/376
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
    end,
  },
}
