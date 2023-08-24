local wezterm = require 'wezterm'
local tabline = require 'tabline'

return {
    color_scheme = "Jellybeans",
    color_schemes = {
        ["everforest"] = {
            foreground = "#d3c6aa",
            background = "#2b3339",
            cursor_bg = "#d3c6aa",
            cursor_fg = "#2b3339",
            cursor_border = "#d3c6aa",
            -- selection_fg = "",
            selection_bg = "#503946",
            -- selection_thumb = "",
            -- split = "",
            brights = {"#7a8478", "#e67e80", "#a7c080", "#dbbc7f", "#7fbbb3", "#df69ba", "#83c092", "fff9e8"},
        }
    },
    font = wezterm.font("JetBrainsMono NF"),
    font_rules = {
        {
            italic = false,
            intensity = "Bold",
            font = wezterm.font("JetBrainsMono NF")
        },
    },
    line_height = 0.9,
    font_size = 7,
    default_prog = {"pwsh.exe", "-NoLogo"},
    launch_menu = {
        {
            label = "CMD",
            args = {"cmd.exe"}
        },
        {
            label = "Powershell",
            args = {"pwsh.exe", "-NoLogo"}
        },
        {
            label = "Powershell 5",
            args = {"powershell.exe", "-NoLogo"}
        },
    },
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_max_width = 13,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    keys = {
        -- closing panes
        {key="w", mods="CTRL|SHIFT|ALT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
        -- splitting panes
        {key="j", mods="CTRL|SHIFT|ALT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        {key="l", mods="CTRL|SHIFT|ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        -- new tab
        {key="m", mods="CTRL|SHIFT|ALT", action=wezterm.action.ShowLauncher},
        {key="n", mods="CTRL|SHIFT|ALT", action=wezterm.action.SpawnTab("CurrentPaneDomain")},
        -- moving through panes
        {key="k", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="j", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="h", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="l", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},
        -- changing pane size
        {key="UpArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
        {key="DownArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
        {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
        {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
    },
}
