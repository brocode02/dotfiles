return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        indent = {
          enabled = true,
          char = "│",
          hl = {
            "SnacksIndent1",
            "SnacksIndent2",
            "SnacksIndent3",
            "SnacksIndent4",
            "SnacksIndent5",
            "SnacksIndent6",
            "SnacksIndent7",
            "SnacksIndent8",
          },
        },
        scope = {
          enabled = true,
          char = "│",
        },
        chunk = {
          enabled = true,
          char = {
            corner_top = "┌",
            corner_bottom = "└",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
        },
        animate = {
          enabled = true,
          style = "out",
        },
      },
    },
  },
}
