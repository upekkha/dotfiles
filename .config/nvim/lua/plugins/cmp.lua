return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")

      -- Disable cmp-buffer in markdown
      cmp.setup.filetype("markdown", {
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          -- { name = "buffer" },
        }),
      })
    end,
  },
}
