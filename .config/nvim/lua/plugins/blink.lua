return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Disable completion from buffer and snippets.
      opts.sources.default = { "lsp", "path" }
      -- Completion sources per filetype (coming with next release).
      -- opts.sources.per_filetype = { markdown = { "lsp", "path" } }
      -- Use <Tab> to select from completion menu.
      opts.keymap = { preset = "super-tab" }
    end,
  },
}
