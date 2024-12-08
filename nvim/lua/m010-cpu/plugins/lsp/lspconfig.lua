return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local nvim_lsp = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    })

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      update_in_insert = true,
      float = {
        source = "always",
      },
    })

    local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
    local enable_format_on_save = function(_, bufnr)
      vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end

    local on_attach = function(_, bufnr)
      local buf_set_keymap = vim.api.nvim_buf_set_keymap

      local opts = { noremap = true, silent = true }

      buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    end

    local protocol = require("vim.lsp.protocol")
    protocol.CompletionItemKind = {
      "", -- Text
      "󰊕", -- Method
      "󰊕", -- Function
      "󰊕", -- Constructor
      "", -- Field
      "", -- Variable
      "", -- Classi
      "󰜰", -- Interface
      "󰏗", -- Module
      "", -- Property
      "", -- Unit
      "󰎠", -- Value
      "", -- Enum
      "󰌋", -- Keyword
      "󰘍", -- Snippet
      "", -- Color
      "", -- File
      "󰆑", -- Reference
      "", -- Folder
      "", -- EnumMember
      "", -- Constant
      "", -- Struct
      "", -- Event
      "󰘧", -- Operator
      "", -- TypeParameter
    }

    nvim_lsp.lua_ls.setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    })

    nvim_lsp.asm_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "asm", "s", "S", "vmasm" },
    })

    nvim_lsp.clangd.setup({
      on_attach = on_attach,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--offset-encoding=utf-16",
      },
    })

    nvim_lsp.sqls.setup({
      -- on_attach = function(client, bufnr)
      -- 	require("sqls").on_attach(client, bufnr)
      -- end,
      on_attach = on_attach,
      settings = {
        sqls = {
          connections = {
            {
              driver = "postgresql",
              dataSourceName =
              "host=127.0.0.1 port=5432 user=postgres password=roger_roger dbname=roger_roger sslmode=disable",
            },
          },
        },
      },
    })

    -- nvim_lsp.tsserver.setup({
    --     on_attach = on_attach,
    --     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    --     cmd = { "typescript-language-server", "--stdio" },
    --     capabilities = capabilities,
    -- })

    nvim_lsp.pylyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    nvim_lsp.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls", "serve" },
      filetypes = { "go", "gomod" },
    })

    -- nvim_lsp.sourcekit.setup({
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    -- })

    nvim_lsp.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    nvim_lsp.intelephense.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    nvim_lsp.nixd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "nixd" },
    })
  end,
}
