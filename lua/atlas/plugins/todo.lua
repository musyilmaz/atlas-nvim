return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>tc",
      "<cmd>Trouble todo<cr>",
      desc = "Todo (Trouble)",
    },
    { "<leader>tv", "<cmd>TodoTelescope<cr>", desc = "Todo (Telescope)" },
  },
  opts = {},
}
