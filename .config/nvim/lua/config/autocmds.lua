-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable markdown autoformat and spellchecking, keep line wrap enabled.
-- https://github.com/LazyVim/LazyVim/discussions/392
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lazyvim_user_markdown", { clear = true }),
  pattern = { "markdown" },
  callback = function()
    vim.b.autoformat = false
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})

-- Disable json autoformat on save.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lazyvim_user_json", { clear = true }),
  pattern = { "json" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Ansible tweaks
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lazyvim_user_ansible", { clear = true }),
  pattern = { "yaml.ansible" },
  callback = function()
    -- Adapt path so that `gf` can jump to files and templates.
    -- See https://github.com/mfussenegger/nvim-ansible/blob/main/ftplugin/ansible.lua
    local fname = vim.api.nvim_buf_get_name(0)
    if fname:find("tasks/") then
      local paths = {
        vim.fs.dirname(fname:gsub("tasks/", "files/")),
        vim.fs.dirname(fname:gsub("tasks/", "templates/")),
        vim.fs.dirname(fname),
      }
      vim.bo.path = table.concat(paths, ",")
    end
  end,
})
