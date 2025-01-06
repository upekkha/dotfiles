return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Completion sources per filetype.
      opts.sources.per_filetype = { markdown = { "lsp", "path" } }
      -- Use <Tab> to select from completion menu.
      opts.keymap = { preset = "super-tab" }
    end,
  },
}
