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

config.default_prog = { '/usr/bin/fish' }

config.colors = {
    background = '#1d1f21',
    foreground = '#c5c8c6'
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.font_size = 18
config.tab_max_width = 30
config.window_close_confirmation = 'NeverPrompt'
config.adjust_window_size_when_changing_font_size = false

config.keys = {
    {
        key = 'x',
        mods = 'CTRL',
        action = act.CloseCurrentTab({ confirm = false })
    },
    {
        key = 't',
        mods = 'CTRL',
        action = act.SpawnTab('CurrentPaneDomain')
    },
    {
        key = 'q',
        mods = 'CTRL',
        action = act.ActivateCopyMode
    },
    {
        key = 'C',
        mods = 'CTRL',
        action = wezterm.action.CopyTo 'Clipboard',
    },
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

for i = 1, 8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL',
        action = act.ActivateTab(i - 1)
    })
end

return config
