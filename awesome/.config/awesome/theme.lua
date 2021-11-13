-- imports
local gears = require("gears")

-- inherit default theme
local theme = dofile(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- theme overrides
theme.useless_gap = 8

-- set fonts
local font = "agave Nerd Font 4"
theme.font = font
theme.hotkeys_font = font
theme.hotkeys_description_font = font

return theme
