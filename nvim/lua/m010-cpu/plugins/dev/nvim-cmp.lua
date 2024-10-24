return {
    "hrsh7th/nvim-cmp",   -- Completion
    dependencies = {
        "hrsh7th/cmp-nvim-lua", -- nvim-cmp source LUA API,
        "hrsh7th/cmp-path", -- nvim-cmp source path,
        "hrsh7th/cmp-buffer", -- nvim-cmp source buffer,
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind.nvim",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
            },
        },
    },
    event = "InsertEnter",

    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
                keyword_length = 1,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:pumblend,FloatBorder:Normal,CursorLine:TermCursor",
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:pumblend,FloatBorder:Normal,CursorLine:TermCursor",
                }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end,
}
