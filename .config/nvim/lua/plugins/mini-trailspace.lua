return {
  {
    "echasnovski/mini.trailspace",
    -- Highlight trailing whitespace and clean with `MiniTrailspace.trim()`.
    config = function()
      require("mini.trailspace").setup()
      -- Disable in snacks dashboard
      -- Source: https://github.com/echasnovski/mini.nvim/issues/1395
      local f = function(args)
        vim.b[args.buf].minitrailspace_disable = true
      end
      vim.api.nvim_create_autocmd("User", { pattern = "SnacksDashboardOpened", callback = f })
    end,
  },
}
