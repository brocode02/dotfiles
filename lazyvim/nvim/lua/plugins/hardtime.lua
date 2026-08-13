return {
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {
      disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
      disabled_filetypes = {
        "neo-tree",
        "oil",
        "netrw",
        "snacks_picker_list",
        "qf",
        "help",
        "checkhealth",
        "lspinfo",
        "trouble",
      },
      restriction_mode = "block",
      max_attempts = 1,
    },
  },
}
