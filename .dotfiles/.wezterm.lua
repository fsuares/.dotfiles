local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

-- config.color_scheme = 'Dark+'

config.color_scheme = "Min"
config.default_cursor_style = "SteadyBar"

config.colors = {
    cursor_bg = "#E0E0E0",
    cursor_fg = "#C0C0C0",
    cursor_border = "#E0E0E0",
    selection_bg = "#363636",

    background = "#212121",
    foreground = "#C0C0C0",

    -- Definindo as cores da paleta
    ansi = {
        "#1A1A1A",  -- black
        "#FF7A84",  -- red
        "#67AB91",  -- green
        "#FFAB70",  -- yellow
        "#79B8FF",  -- blue
        "#B392F0",  -- purple
        "#7CAFC2",  -- cyan
        "#E0E0E0",  -- white
    },
    brights = {
        "#666666",  -- bright black
        "#FF7A84",  -- bright red
        "#67AB91",  -- bright green
        "#FFAB70",  -- bright yellow
        "#79B8FF",  -- bright blue
        "#B392F0",  -- bright purple
        "#7CAFC2",  -- bright cyan
        "#FFFFFF",  -- bright white
    },

    -- Outras cores personalizadas
    tab_bar = {
        active_tab = {
            bg_color = '#181926',
            fg_color = '#F5C2E7',
        },
        inactive_tab = {
            bg_color = '#181926',
            fg_color = '#FFFFFF',
        },
    },
}

-- config.font = wezterm.font 'JetbrainsMono Nerd Font Regular'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 12
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true

local padding_padrao = { left = 20, right = 20, top = 20, bottom = 20 }


local function ajustar_padding(window)
  local overrides = window:get_config_overrides() or {}

  if window:active_pane():get_foreground_process_name():find("nvim") then
    overrides.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
  else
    overrides.window_padding = padding_padrao
  end

  window:set_config_overrides(overrides)
end

wezterm.on("update-right-status", ajustar_padding)


config.window_decorations = "RESIZE"

config.window_frame = {
    font = wezterm.font { family = 'Roboto Regular', weight = 'Bold' },
    font_size = 12.0,
    active_titlebar_bg = '#15161E',
    inactive_titlebar_bg = '#181926',
}

-- config.colors = {
--     tab_bar = {
--         active_tab = {
--             bg_color = '#181926',
--             fg_color = '#F5C2E7',
--         },
--         inactive_tab = {
--             bg_color = '#181926',
--             fg_color = '#FFFFFF',
--         },
--     }
-- }

config.keys = {
    {
        key = 't',
        mods = 'CTRL|ALT',
        action = act.SpawnTab 'CurrentPaneDomain'
    },
    {
        key = 'q',
        mods = 'CTRL|ALT',
        action = wezterm.action.CloseCurrentTab { confirm = false },
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|ALT',
        action = act.ActivateTabRelative(-1)
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|ALT',
        action = act.ActivateTabRelative(1)
    },
    {
        key = 'h',
        mods = 'CTRL|ALT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'v',
        mods = 'CTRL|ALT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'h',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Left'
    },
    {
        key = 'j',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Down'
    },
    {
        key = 'k',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Up'
    },
    {
        key = 'l',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Right'
    },
    {
        key = 'q',
        mods = 'ALT',
        action = act.CloseCurrentPane { confirm = true }
    }
}

return config
