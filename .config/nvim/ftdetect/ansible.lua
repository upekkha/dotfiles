-- Expand ft detection from nvim-ansible
-- See https://github.com/mfussenegger/nvim-ansible/blob/main/ftdetect/ansible.lua
vim.filetype.add({
  pattern = {
    [".*/playbooks/.*/.*%.yml"] = "yaml.ansible",
    [".*/roles.*/.*/tasks/.*%.yml"] = "yaml.ansible",
    [".*/roles.*/.*/handlers/.*%.yml"] = "yaml.ansible",
  },
})
