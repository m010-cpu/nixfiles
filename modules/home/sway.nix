{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    xwayland.enable = false;

    extraConfig = ''
      #!/bin/sh

      # Set background
      ${pkgs.swaybg}/bin/swaybg -i ${config.stylix.image} -m fill &

      # Input configuration (device-specific tweaks)
      input "ELAN06C6:00_04F3:3193" {
          natural_scroll enabled
          tap enabled
          tap_button_map left_right_middle
          scroll_method two_finger
          pointer_accel 0.7
      }

      input "TPPS/2_Elan_TrackPoint" {
          pointer_accel -0.55
      }

      # Autostart apps
      exec waybar &
      exec fcitx5 &
      exec gammastep -l 48.85:2.35 &

      # Custom keybindings
      set $mod Mod4

      # Example: launch specific apps
      bindsym $mod+d exec wofi --show drun
      bindsym $mod+l exec swaylock

      # Scratchpad / floating toggle
      bindsym $mod+v floating toggle

      # Custom mouse drag / resize
      mode "resize" {
          bindsym pointer1 move
          bindsym pointer3 resize
          bindsym Escape mode "default"
      }
      bindsym $mod+r mode "resize"

      # Media keys
      bindsym XF86AudioRaiseVolume exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindsym XF86AudioMicMute exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindsym XF86MonBrightnessUp exec brightnessctl s 1%+
      bindsym XF86MonBrightnessDown exec brightnessctl s 1%-
      bindsym XF86AudioNext exec playerctl next
      bindsym XF86AudioPrev exec playerctl previous
      bindsym XF86AudioPlay exec playerctl play-pause
    '';
  };
}
