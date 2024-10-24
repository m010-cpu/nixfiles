return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local status, ts = pcall(require, "nvim-treesitter.configs")
        if not status then
            return
        end

        ts.setup({
            auto_install = true,
            highlight = {
                enable = true,
                disable = {},
            },
            indent = {
                enable = true,
                disable = {},
            },
            ensure_installed = {
                "regex",
                "markdown",
                "markdown_inline",
                "tsx",
                "typescript",
                "toml",
                "fish",
                "php",
                "json",
                "yaml",
                "swift",
                "css",
                "html",
                "lua",
                "python",
                "bash",
                "go",
                "vim",
                "c",
                "cpp",
            },
            autotag = {
                enable = true,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        })
    end,
}
