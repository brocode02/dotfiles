return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        update_in_insert = true,
      },
      servers = {
        -- 1. Explicitly tell Mason to stop trying to install pyright
        pyright = {
          mason = false,
          autostart = false,
        },

        -- 2. basedpyright settings
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "off",
                diagnosticMode = "workspace",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },

      -- 3. This forcefully blocks LazyVim's default pyright engine from starting
      setup = {
        pyright = function()
          return true
        end,
      },
    },
  },
}

-- ==========================================
-- ORIGINAL PYRIGHT CONFIGURATION (BACKUP)
-- ==========================================
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       diagnostics = {
--         update_in_insert = true,
--       },
--       servers = {
--         pyright = {
--           settings = {
--             python = {
--               analysis = {
--                 diagnosticMode = "workspace",
--                 autoSearchPaths = true,
--                 useLibraryCodeForTypes = true,
--               },
--             },
--           },
--         },
--       },
--     },
--   },
-- }
