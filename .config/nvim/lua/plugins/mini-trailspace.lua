return {
  {
    "echasnovski/mini.trailspace",
    -- Highlight trailing whitespace and clean with `MiniTrailspace.trim()`.
    config = function()
      require("mini.trailspace").setup()
    end,
  },
}
