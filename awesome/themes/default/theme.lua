local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local awful = require("awful")
local config_path = awful.util.getdir("config")

local theme = {}

theme.font          = "Roboto Regular 10"
theme.mono_font     = "Iosevka SS04 Regular 10"


theme.bg_normal     = "#d1d3d2"
theme.bg_bright     = "#fdaffc"
theme.bg_focus      = "#95b29f"
theme.bg_urgent     = "#a85751"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#888888"
theme.fg_focus      = "#212121"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#626262"

theme.useless_gap   = dpi(22)
theme.border_width  = dpi(0)
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_marked = theme.bg_bright

theme.border_radius = 5

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- 1theme.notification_width = 500
-- theme.notification_height = 75
theme.notification_margin = 15
theme.notification_padding = 30
theme.notification_spacing = 5
theme.notification_border_width = 0
theme.notification_bg = theme.bg_bright
theme.notification_fg = theme.fg_focus
theme.notification_position = "bottom_right"
theme.notification_icon_size = 40

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
