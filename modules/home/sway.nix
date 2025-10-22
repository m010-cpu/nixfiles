{
  pkgs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;
    systemd.enable = true;
    systemd.variables = ["--all"];

    config = {
      modifier = "Mod4";
      terminal = "wezterm";

      defaultWorkspace = "workspace number 1";

      output = {
        "eDP-1" = {
          mode = "1920x1200@60.002Hz";
        };
      };

      bars = [
        {
          command = "waybar";
        }
      ];

      startup = [
        {command = "swaybg -i ${config.stylix.image} -m fill";}
        {command = "fcitx5";}
        {command = "gammastep -l 48.85:2.35";}
      ];

      gaps = {
        bottom = 1;
        top = 5;
        inner = 5;
        outer = 1;
      };

      input = {
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
          pointer_accel = "0.7";
        };

        "type:pointer" = {
          natural_scroll = "enabled";
          pointer_accel = "-0.55";
        };

        "type:mouse" = {
          natural_scroll = "disabled";
        };
      };

      keybindings = lib.mkOptionDefault {
        "${config.wayland.windowManager.sway.config.modifier}+d" = "exec rofi -show drun";
        "${config.wayland.windowManager.sway.config.modifier}+l" = "exec swaylock";

        "${config.wayland.windowManager.sway.config.modifier}+Right" = "exec playerctl next";
        "${config.wayland.windowManager.sway.config.modifier}+Down" = "exec playerctl play-pause";
        "${config.wayland.windowManager.sway.config.modifier}+Left" = "exec playerctl previous";

        "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "XF86MonBrightnessUp" = "exec brightnessctl set 1%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 1%-";

        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86AudioPause" = "exec playerctl play-pause";
        "XF86AudioPlay" = "exec playerctl play-pause";
      };
    };

    extraConfig = ''
      bindgesture swipe:3:left  workspace next
      bindgesture swipe:3:right workspace prev
    '';
  };
}
