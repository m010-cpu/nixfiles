return {
    { "echasnovski/mini.base16", version = "*" },

    config = function()
        local status, base16 = pcall(require, "mini.base16")
        if not status then
            return
        end

        base16.setup()
    end,
}
