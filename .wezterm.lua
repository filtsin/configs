-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.colors = {
    background = '#1d1f21',
    foreground = '#c5c8c6'
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.font_size = 14
config.tab_max_width = 30


config.keys = {
    {
        key = 'x',
        mods = 'CTRL',
        action = act.CloseCurrentTab({ confirm = true})
    },
    {
        key = 't',
        mods = 'CTRL',
        action = act.SpawnTab('CurrentPaneDomain')
    }
}

for i = 1,8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL',
        action = act.ActivateTab(i - 1)
    })
end

return config

