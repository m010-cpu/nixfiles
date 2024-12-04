return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local status, conform = pcall(require, "conform")
    if not status then
      return
    end

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        nix = { "alejandra" },
        asm = { "asmfmt" },
        sql = { "sqlfluff" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })
  end,
}
