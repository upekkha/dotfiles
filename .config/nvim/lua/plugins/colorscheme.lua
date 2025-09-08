return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      -- custom colors for diff
      on_colors = function(colors)
        colors.diff = {
          add = "#004200",
          change = "#1f2231",
          delete = "#420000",
          text = "#2c809c",
        }
      end,
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
