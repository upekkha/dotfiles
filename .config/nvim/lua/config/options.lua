-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Other
vim.opt.tabstop = 4 -- One tab is 4 spaces
vim.opt.softtabstop = 4 -- One tab while editing is 4 spaces
vim.opt.shiftwidth = 4 -- One indent is 4 spaces
vim.opt.number = true -- Toggle line numbers
vim.opt.relativenumber = false -- Toggle relative line numbers
vim.opt.mousescroll = "ver:3,hor:1" -- Reduce horziontal scroll speed
vim.opt.cursorline = false -- Toggle highlight of line under cursor
vim.opt.shell = "bash_login_shell" -- Open terminal with `bash -l` wrapper
--vim.g.mapleader = "\\"                -- Use backslash as leader

-- Neovide
if vim.g.neovide then
  vim.opt.guifont = "MesloLGS NF:h12" -- Use 12pt Meslo Nerdfont
  vim.g.neovide_cursor_animation_length = 0 -- Disable cursor animation
  vim.opt.title = true -- Enable title
  vim.opt.titlestring = "%t" -- Show filename as title

  -- Keyboard shortcuts
  vim.keymap.set("n", "<D-s>", ":w<CR>")
  vim.keymap.set("n", "<D-w>", ":BufDel<CR>")
  vim.keymap.set("v", "<D-c>", '"+y')
  vim.keymap.set( -- Paste https://github.com/neovide/neovide/issues/1263#issuecomment-1972013043
    { "n", "v", "s", "x", "o", "i", "l", "c", "t" },
    "<D-v>",
    function()
      vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
    end,
    { noremap = true, silent = true }
  )
  vim.keymap.set({ "n", "v", "i" }, "<D-Left>", "<Home>")
  vim.keymap.set({ "n", "v", "i" }, "<D-Right>", "<End>")
  vim.keymap.set("n", "<D-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05<CR>")
  vim.keymap.set("n", "<D-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05<CR>")
  vim.keymap.set("n", "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

-- Filetypes
vim.filetype.add({
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})
