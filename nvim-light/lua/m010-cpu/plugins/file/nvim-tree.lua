return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {},
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },

    config = function()
        local status, tree = pcall(require, "nvim-tree")
        if not status then
            return
        end

        tree.setup({
            sort_by = "case_sensitive",
            view = {
                adaptive_size = true,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })
    end,
}
