return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "jq" },
        markdown = {},
        python = { "ruff_format" },
      },
    },
  },
}
