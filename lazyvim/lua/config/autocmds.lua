-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Save theme to file when changed (for persistence across restarts)
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(args)
    local f = io.open(vim.fn.stdpath("data") .. "/nvim_theme", "w")
    if f then
      f:write(args.match)
      f:close()
    end
  end,
})

-- Hide inline error text while typing, show only underlines
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.diagnostic.config({
      virtual_text = { prefix = "●", spacing = 2 },
    })
  end,
})

local pyright_watch_group = vim.api.nvim_create_augroup("pyright_watch_new_python_files", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = pyright_watch_group,
  pattern = "*.py",
  callback = function(args)
    local path = vim.api.nvim_buf_get_name(args.buf)
    if path == "" then
      return
    end

    local uri = vim.uri_from_fname(path)

    for _, name in ipairs({ "pyright", "basedpyright" }) do
      for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
        local root = client.config.root_dir
        if root and (path == root or vim.startswith(path, root .. "/")) then
          -- Brute-force both Created (1) and Changed (2) events.
          client:notify("workspace/didChangeWatchedFiles", {
            changes = {
              { uri = uri, type = 1 }, -- 1 = Created
              { uri = uri, type = 2 }, -- 2 = Changed
            },
          })
        end
      end
    end
  end,
})
-- local pyright_watch_group = vim.api.nvim_create_augroup("pyright_watch_new_python_files", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufNewFile", {
--   group = pyright_watch_group,
--   pattern = "*.py",
--   callback = function(args)
--     vim.b[args.buf].pyright_new_file = true
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = pyright_watch_group,
--   pattern = "*.py",
--   callback = function(args)
--     local path = vim.api.nvim_buf_get_name(args.buf)
--     if path == "" then
--       return
--     end
--
--     local event_type = vim.b[args.buf].pyright_new_file and 1 or 2
--     local uri = vim.uri_from_fname(path)
--
--     for _, name in ipairs({ "pyright", "basedpyright" }) do
--       for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
--         local root = client.config.root_dir
--         if root and (path == root or vim.startswith(path, root .. "/")) then
--           client.notify("workspace/didChangeWatchedFiles", {
--             changes = {
--               {
--                 uri = uri,
--                 type = event_type,
--               },
--             },
--           })
--         end
--       end
--     end
--
--     vim.b[args.buf].pyright_new_file = nil
--   end,
-- })
--
-- Make background transparent every time a theme is loaded
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   end,
-- })
