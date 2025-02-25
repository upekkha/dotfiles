return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      on_highlights = function(hl, c)
        -- no special highlighting of inline code blocks
        hl["@markup.raw.markdown_inline"] = {
          bg = "#1c1f30",
          fg = "#82aaff",
        }
        -- increase visibility of split windows
        hl["WinSeparator"] = {
          fg = c.comment,
        }
      end,
    },
  },
}
