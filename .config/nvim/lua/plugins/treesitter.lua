return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- additional treesitter languages
    opts = {
      ensure_installed = {
        "perl",
        "sql",
      },
    },
  },
}
