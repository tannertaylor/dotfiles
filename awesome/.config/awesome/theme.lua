-- imports
local gears = require("gears")

-- inherit default theme
local theme = dofile(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- theme overrides
theme.useless_gap = 8
theme.font = "agave Nerd Font 4"

return theme
