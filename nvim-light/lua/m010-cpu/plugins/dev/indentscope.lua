return {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local status, indentscope = pcall(require, "mini.indentscope")
        if not status then
            return
        end

        indentscope.setup({
            symbol = "▏",
        })
    end,
}
