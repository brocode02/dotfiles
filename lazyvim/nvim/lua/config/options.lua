-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local theme_file = vim.fn.stdpath("data") .. "/nvim_theme"
local ok, saved = pcall(vim.fn.readfile, theme_file)
if ok and saved and #saved > 0 and saved[1] ~= "" then
  vim.g.colorscheme = saved[1]
else
  vim.g.colorscheme = "github_dark_default"
end

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2 },
  underline = true,
  signs = true,
  update_in_insert = true,
})
