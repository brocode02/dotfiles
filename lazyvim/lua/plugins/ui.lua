return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.g.colorscheme,
    },
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "andrew-george/telescope-themes",
    },
    keys = {
      {
        "<leader>tT",
        "<cmd>Telescope themes<cr>",
        desc = "Theme Switcher",
      },
    },
    config = function()
      require("telescope").load_extension("themes")
    end,
  },
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {},
  },
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
    },
  },
}
