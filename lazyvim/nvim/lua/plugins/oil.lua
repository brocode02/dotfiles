return {
  "stevearc/oil.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "<leader>fe",
      function()
        require("oil").open(vim.fn.expand("%:p:h"))
      end,
      desc = "Oil (Current File Dir)",
    },
    {
      "<leader>e",
      function()
        require("oil").open()
      end,
      desc = "Oil (Root Dir)",
    },
  },
}
