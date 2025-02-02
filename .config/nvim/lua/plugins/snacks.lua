return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Disable indent guides
      indent = { enabled = false },
      -- Fuzzy picker
      picker = {
        -- Show hidden files and follow symlinks
        sources = {
          files = { hidden = true, follow = true },
          explorer = { hidden = true, follow = true },
        },
        -- Add macOS-compatible keymaps to toggle hidden and ignored files.
        win = {
          input = {
            keys = {
              ["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
              ["<c-i>"] = { "toggle_ignore", mode = { "i", "n" } },
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
      -- Customize dashboard
      dashboard = {
        preset = {
          header = [[
  ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
  ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
  ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
  ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
  ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
  ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
          ]],
        },
      },
    },
  },
}
