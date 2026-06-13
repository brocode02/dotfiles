return {
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      debounce_delay = 1000,
      condition = function(buf)
        local file_path = vim.api.nvim_buf_get_name(buf)
        local shell_config_path = vim.fn.expand("~/.config/illogical-impulse/config.json")
        return file_path ~= shell_config_path
      end,
    },
  },
}
