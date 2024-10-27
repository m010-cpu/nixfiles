return {
    { "echasnovski/mini.nvim", version = "*" },

    config = function()
        local status, minibase16 = pcall(require, "mini.base16")
        if not status then
            return
        end

        minibase16.setup()
    end,
}
