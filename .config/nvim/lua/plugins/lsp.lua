return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off", -- disable pyright type checks
              },
            },
          },
        },
      },
    },
  },
}
