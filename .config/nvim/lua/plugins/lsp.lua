return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {
          mason = false,
        },
        marksman = {
          mason = false,
        },
        lua_ls = {
          mason = false,
        },
        pyright = {
          mason = false,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off", -- disable pyright type checks
              },
            },
          },
        },
        ruff = {
          mason = false,
        },
      },
    },
  },
}
