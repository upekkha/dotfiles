return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim
    opts = {
      code = {
        style = "normal", -- disable lang icons
      },
      -- Multi-line quotes
      quote = {
        repeat_linebreak = true,
      },
      win_options = {
        showbreak = { default = "", rendered = "  " },
        breakindent = { default = false, rendered = true },
        breakindentopt = { default = "", rendered = "" },
      },
    },
  },
}
