local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.color_scheme = "SolarizedDark (Gogh)"
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 11
-- config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.custom_block_glyphs = false
config.native_macos_fullscreen_mode = true

config.keys = {
    {
        key = "f",
        mods = "CTRL|CMD",
        action = wezterm.action.ToggleFullScreen,
    },
}

config.window_frame = {
    font = wezterm.font({ family = "MesloLGS NF", weight = "Bold" }),
    font_size = 12.0,
    active_titlebar_bg = "#0e2a35",
    inactive_titlebar_bg = "#333333",
}

config.colors = {
    tab_bar = {
        inactive_tab_edge = "#575757",
    },
}

config.window_decorations = "NONE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

config.window_close_confirmation = "NeverPrompt"
return config
