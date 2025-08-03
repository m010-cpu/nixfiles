{
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = false;
    systemd.enable = true;
    systemd.variables = ["--all"];

    extraConfig = ''
      set $mod Mod4

      ### Autostart
      riverctl spawn waybar
      riverctl spawn fcitx5
      riverctl spawn gammastep -l 48.85:2.35
      riverctl spawn rivertile

      ### Scratchpad Tags
      scratchpad_bitwarden=$((1 << 20))
      scratchpad_nautilus=$((1 << 21))
      riverctl spawn-tagmask $(((1 << 32) - 1) ^ $scratchpad_bitwarden)

      # Bitwarden scratchpad
      riverctl map normal $mod+Shift B spawn bitwarden
      riverctl map normal $mod B toggle-focused-tags $scratchpad_bitwarden
      riverctl rule-add app-id "Bitwarden" float

      # Nautilus scratchpad
      riverctl map normal $mod+Shift E spawn nautilus
      riverctl map normal $mod E toggle-focused-tags $scratchpad_nautilus
      riverctl rule-add app-id "Nautilus" float

      ### Base apps
      riverctl map normal $mod Q spawn wezterm
      riverctl map normal $mod Return spawn wezterm
      riverctl map normal $mod D spawn "rofi -show drun"
      riverctl map normal $mod L spawn swaylock
      riverctl map normal $mod C close
      riverctl map normal $mod M exit
      riverctl map normal $mod V toggle-float

      ### Window movement
      riverctl map normal $mod+Control H focus-view left
      riverctl map normal $mod+Control L focus-view right
      riverctl map normal $mod+Control K focus-view up
      riverctl map normal $mod+Control J focus-view down

      riverctl map normal $mod+Shift H move-view left 100
      riverctl map normal $mod+Shift L move-view right 100
      riverctl map normal $mod+Shift K move-view up 100
      riverctl map normal $mod+Shift J move-view down 100

      ### Fullscreen
      riverctl map normal $mod+Control F toggle-fullscreen

      ### Screenshots
      # riverctl map normal od+Control 3 spawn 'grim -o $(swaymsg -t get_outputs | jq -r ".[] | select(.focused).name") ~/Pictures/screenshot.png'
      # riverctl map normal $mod+Control 4 spawn 'grim -g "$(slurp)" ~/Pictures/screenshot.png'

      ### Mouse drag / resize
      riverctl map-pointer normal $mod BTN_LEFT move-view
      riverctl map-pointer normal $mod BTN_RIGHT resize-view

      ### Media keys
      riverctl map normal None XF86AudioRaiseVolume spawn 'wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'
      riverctl map normal None XF86AudioLowerVolume spawn 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'
      riverctl map normal None XF86AudioMute spawn 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'
      riverctl map normal None XF86AudioMicMute spawn 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'
      riverctl map normal None XF86MonBrightnessUp spawn 'brightnessctl s 1%+'
      riverctl map normal None XF86MonBrightnessDown spawn 'brightnessctl s 1%-'
      riverctl map normal None XF86AudioNext spawn 'playerctl next'
      riverctl map normal None XF86AudioPrev spawn 'playerctl previous'
      riverctl map normal None XF86AudioPause spawn 'playerctl play-pause'
      riverctl map normal None XF86AudioPlay spawn 'playerctl play-pause'
      riverctl map normal $mod+Shift Right spawn 'playerctl next'
      riverctl map normal $mod+Shift Down spawn 'playerctl play-pause'
      riverctl map normal $mod+Shift Left spawn 'playerctl previous'
    '';
  };
}
