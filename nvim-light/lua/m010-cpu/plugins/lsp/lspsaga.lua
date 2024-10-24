return {
    "glepnir/lspsaga.nvim", -- LSP UIs
    event = "LspAttach",

    config = function()
        local saga = require("lspsaga")

        saga.setup({
            ui = {
                winblend = 10,
                border = "rounded",
                colors = {
                    normal_bg = "#002b36",
                },
            },
        })
    end,
}
