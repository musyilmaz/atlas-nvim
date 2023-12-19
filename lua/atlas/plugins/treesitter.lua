return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      local treesitter_context = require("treesitter-context")

      treesitter.setup({
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        incremental_selection = { enable = false },
        ensure_installed = {
          "astro",
          "lua",
          "bash",
          "css",
          "dockerfile",
          "gitignore",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "prisma",
          "scss",
          "typescript",
          "tsx",
          "yaml",
        },
        sync_install = false,
        auto_install = true,
      })

      treesitter_context.setup({})
      require('ts_context_commentstring').setup({})
    end
  },
}
