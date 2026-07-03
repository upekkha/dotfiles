-- Expand ft detection for Perl template-toolkit .tt files.
vim.filetype.add({
  pattern = {
    [".*%.tt"] = "html",
  },
})
