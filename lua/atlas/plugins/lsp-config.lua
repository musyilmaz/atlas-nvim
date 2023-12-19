return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }

      local on_attach = function(_, bufnr)
        opts.buffer = bufnr

        keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        keymap.set("n", "<leader>go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        keymap.set("n", "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
        keymap.set("n", "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure typescript server with plugin
      lspconfig["tsserver"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure tailwindcss server
      lspconfig["tailwindcss"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure prisma orm server
      lspconfig["prismals"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure graphql language server
      lspconfig["graphql"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      })

      -- configure emmet language server
      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
  },
}
