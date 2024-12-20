; Override treesitter for markdown to not conceal code blocks.
; See https://github.com/nvim-treesitter/nvim-treesitter/issues/5751#issuecomment-2311310008
; https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/markdown/highlights.scm
; [
;   (fenced_code_block_delimiter)
; ] @punctuation.delimiter
