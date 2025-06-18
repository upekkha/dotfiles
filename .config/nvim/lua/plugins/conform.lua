return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "jq" },
        python = { "ruff_format" },
      },
    },
  },
}
