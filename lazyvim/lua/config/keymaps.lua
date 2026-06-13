-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")

  local file = vim.fn.expand("%:p")
  vim.cmd("botright 12split")
  vim.cmd("terminal python3 " .. vim.fn.shellescape(file))
  vim.cmd("startinsert")
end, { desc = "Run current Python file" })

