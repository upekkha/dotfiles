return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--vimgrep",
          "--no-hidden", -- do not include hidden files
          "--ignore", -- do not include ignored files
          "--follow", -- follow symlinks
        },
      },
      pickers = {
        find_files = { follow = true }, -- follow symlinks when finding files
      },
    },
    keys = {
      {
        --Custom keymap to pick from all files (incl hidden and listed in gitignore).
        "<leader>fa",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files (all)",
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
    "rcarriga/nvim-dap-ui",
    -- Keep debugger ui open after execution finishes.
    -- https://github.com/rcarriga/nvim-dap-ui/issues/376
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
    end,
  },
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
  {
    "nvim-lualine/lualine.nvim",
    -- Customize statusline to remove superfluous elements.
    -- Adapted from ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/ui.lua
    opts = {
      sections = {
        lualine_b = {},
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    -- Customize dashboard.
    opts = {
      dashboard = {
        preset = {
          header = [[
  ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
  ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
  ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
  ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
  ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
  ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
          ]],
        },
      },
    },
  },
}
