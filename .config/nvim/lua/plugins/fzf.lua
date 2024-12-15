return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      -- Add macOS-compatible keymaps to toggle hidden and ignored files.
      local config = require("fzf-lua.config")
      local actions = require("fzf-lua.actions")
      config.defaults.actions.files["ctrl-i"] = { actions.toggle_ignore }
      config.defaults.actions.files["ctrl-h"] = { actions.toggle_hidden }
    end,
  },
}
