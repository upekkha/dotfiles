return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = { "rg", "--vimgrep", "--no-hidden", "--follow" }, -- follow symlinks when grepping
      },
      pickers = {
        find_files = { follow = true }, -- follow symlinks when finding files
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {}, -- Disable linting of markdown
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Only complete filenames in markdown
      cmp.setup.filetype("markdown", {
        sources = cmp.config.sources({
          { name = "path" },
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Language servers to install
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      servers = {
        --jinja_lsp = {},   -- jinja
        --marksman = {},    -- markdown
        --pyright = {},     -- python
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]], -- match keyword even without colon
        comments_only = false, -- also match outside of comments
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]], -- match keyword even without colon
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
   "nvimdev/dashboard-nvim",
   -- Custom dashboard logo
   -- https://github.com/LazyVim/LazyVim/discussions/742
   opts = function(_, opts)
       local logo = [[
  ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
  ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
  ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
  ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
  ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
  ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
      ]]
      logo = string.rep("\n", 5) .. logo .. string.rep("\n", 3)
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
