return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--vimgrep",
          "--no-hidden", -- do not include hidden files
          "--ignore", -- do not include ignored files
          "--follow", -- follow symlinks
        },
      },
      pickers = {
        find_files = { follow = true }, -- follow symlinks when finding files
      },
    },
    keys = {
      {
        --Custom keymap to pick from all files (incl hidden and listed in gitignore).
        "<leader>fa",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files (all)",
      },
    },
  },
}
