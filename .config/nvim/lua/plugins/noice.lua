return {
  {
    "folke/noice.nvim",
    -- Work-around for pyright lsp checkmarks flooding screen on file open.
    -- See: https://github.com/LazyVim/LazyVim/discussions/7207
    opts_extend = { "routes" },
    opts = {
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            any = {
              { find = "pyright" },
            },
          },
          opts = { skip = true },
        },
      },
    },
  },
}
