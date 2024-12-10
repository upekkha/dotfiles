; Override treesitter for markdown to only fold headers (but no code blocks or lists).
; https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/markdown/folds.scm
([
  (section)
] @fold
  (#trim! @fold))
