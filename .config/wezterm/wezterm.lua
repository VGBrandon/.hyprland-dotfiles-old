local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  --window_decorations = "RESIZE",
  default_cursor_style = "SteadyBlock",
  color_scheme = "Ashes (base16)",
  font = wezterm.font("JetBrains Mono", { weight = "DemiBold" }),
  font_size = 10.6,
  --[[ background = {
    {
      --Imagen
      source = {
        File = "/home/vgbrandon/Pictures/wallpaper2.jpeg",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
      width = "100%",
      height = "100%",
    },
    {
      source = {
        Color = "#1F2020",
      },
      width = "100%",
      height = "100%",
      opacity = 0.55,
    },
  }, ]]
  window_padding = {
    left = 20,
    right = 20,
    top = 0,
    bottom = 0,
  },
}

return config
