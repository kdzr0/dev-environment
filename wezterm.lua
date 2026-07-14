-- WEZTERM CONFIGURATION FILE

-- API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- SHELL
config.default_prog = { "wsl.exe", "-d", "archlinux" }

-- FONT
config.font = wezterm.font("Maple Mono NF")
config.font_size = 14.0

-- COLORSCHEME
config.color_scheme = 'Tokyo Night'

-- WINDOW
config.window_decorations = "RESIZE"
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

-- TAB BAR
config.enable_tab_bar = false

-- CURSOR
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0

-- BELL
config.audible_bell = "Disabled"

-- MISC
config.check_for_updates = false
config.scrollback_lines = 0

-- PERFORMANCE
config.front_end = "WebGpu"
config.max_fps = 144
config.animation_fps = 1

return config