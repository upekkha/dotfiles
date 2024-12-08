return {
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
}
