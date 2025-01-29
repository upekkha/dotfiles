return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim
    opts = {
      code = {
        style = "normal", -- disable lang icons
      },
      quote = {
        repeat_linebreak = true, -- multi-line quotes
      },
      pipe_table = {
        style = "normal", -- no horizontal lines above/below table
      },
      win_options = {
        showbreak = { default = "", rendered = "  " },
        breakindent = { default = false, rendered = true },
        breakindentopt = { default = "", rendered = "" },
      },
    },
  },
}
