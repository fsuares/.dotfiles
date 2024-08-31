-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 12
config.window_background_opacity = 0.85

config.window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'Roboto Regular', weight = 'Bold' },
  
    -- The size of the font in the tab bar.
    -- Default to 10.0 on Windows but 12.0 on other systems
    font_size = 12.0,
  
    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#15161e',
  
    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#15161e',
  }
  
  config.colors = {
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        active_tab = {
            -- The color of the background area for the tab
            bg_color = '#1a1b26',
            -- The color of the text for the tab
            fg_color = '#c0c0c0',
        },
        inactive_tab = {
            bg_color = '#15161e',
            fg_color = '#808080',
      
            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab`.
        },
    }
  }

-- and finally, return the configuration to wezterm
return config