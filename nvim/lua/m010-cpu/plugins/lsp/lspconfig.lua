return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    -- capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- diagnostics
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
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })

    -- format on save helper
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

    -- on_attach
    local on_attach = function(_, bufnr)
      local buf_set_keymap = vim.api.nvim_buf_set_keymap
      local opts = { noremap = true, silent = true }

      buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    end

    -- completion item icons
    local protocol = require("vim.lsp.protocol")
    protocol.CompletionItemKind = {
      "", -- Text
      "󰊕", -- Method
      "󰊕", -- Function
      "󰊕", -- Constructor
      "", -- Field
      "", -- Variable
      "", -- Class
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

    -- global defaults for all servers
    vim.lsp.config("*", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- lua_ls
    vim.lsp.config("lua_ls", {
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

    -- asm_lsp
    vim.lsp.config("asm_lsp", {
      filetypes = { "asm", "s", "S", "vmasm" },
    })

    -- clangd
    vim.lsp.config("clangd", {
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

    -- sqls
    vim.lsp.config("sqls", {
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

    -- gopls
    vim.lsp.config("gopls", {
      cmd = { "gopls", "serve" },
      filetypes = { "go", "gomod" },
    })

    -- tailwindcss
    vim.lsp.config("tailwindcss", {
      cmd = { "vscode-eslint-language-server" },
    })

    -- eslint
    vim.lsp.config("eslint", {
      -- uncomment if you want EslintFixAll on save:
      -- on_attach = function(client, bufnr)
      --   on_attach(client, bufnr)
      --   vim.api.nvim_create_autocmd("BufWritePre", {
      --     buffer = bufnr,
      --     command = "EslintFixAll",
      --   })
      -- end,
    })

    -- nixd
    vim.lsp.config("nixd", {
      cmd = { "nixd" },
    })

    -- pyright
    -- vim.lsp.config("pyright")

    -- intelephense
    -- vim.lsp.config("intelephense", {})

    -- texlab
    -- vim.lsp.config("texlab", {})

    -- enable all the servers
    vim.lsp.enable({
      "lua_ls",
      "asm_lsp",
      "clangd",
      "sqls",
      "pyright",
      "gopls",
      "tailwindcss",
      "eslint",
      "intelephense",
      "texlab",
      "nixd",
    })
  end,
}
