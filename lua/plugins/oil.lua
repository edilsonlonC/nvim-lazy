return {
  "stevearc/oil.nvim",
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 5,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
