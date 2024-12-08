return {
  {
    "nvim-lualine/lualine.nvim",
    -- Customize statusline to remove superfluous elements.
    -- Adapted from ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/ui.lua
    opts = {
      sections = {
        lualine_b = {},
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
          },
        },
      },
    },
  },
}
