{
  pkgs,
  config,
  ...
}: {
  services.fusuma = {
    enable = true;
    extraPackages = with pkgs; [coreutils wtype];
    settings = {
      threshold = {
        swipe = 0.1;
      };
      interval = {
        swipe = 0.7;
      };
      swipe = {
        "3" = {
          left = {
            command = "wtype -M ctrl -M logo -k right -m logo -m ctrl";
          };
          right = {
            command = "wtype -M ctrl -M logo -k left -m logo -m ctrl";
          };
        };
      };
    };
  };

  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = false;
    systemd.enable = true;
    systemd.variables = ["--all"];

    extraConfig = ''
      #!/bin/sh

      # Set background and border color
      # -m [ stretch | fill | fit | center | tile ]
      ${pkgs.swaybg}/bin/swaybg -i ${config.stylix.image} &
      riverctl border-width 2
      riverctl focus-follows-cursor always
      riverctl set-cursor-warp on-focus-change

      # Set keyboard repeat rate
      riverctl set-repeat 50 300

      # Make all views with an app-id that starts with "float" and title "foo" start floating.
      riverctl rule-add -app-id 'float*' -title 'foo' float
      riverctl rule-add -app-id '*' ssd

      riverctl default-layout filtile
      filtile \
        --output DP-3 view-padding 1 outer-padding 2 \
        --output DP-3 smart-padding-h 320 &
        --output HDMI-A-1 view-padding 1 outer-padding 2 \
        --output HDMI-A-1 smart-padding-h 320 &

      riverctl input pointer-1267-12691-ELAN06C6:00_04F3:3193_Touchpad natural-scroll enabled
      riverctl input pointer-1267-12691-ELAN06C6:00_04F3:3193_Touchpad tap enabled
      riverctl input pointer-1267-12691-ELAN06C6:00_04F3:3193_Touchpad tap-button-map left-right-middle
      riverctl input pointer-1267-12691-ELAN06C6:00_04F3:3193_Touchpad scroll-method two-finger
      riverctl input pointer-1267-12691-ELAN06C6:00_04F3:3193_Touchpad pointer-accel 0.7

      riverctl input pointer-2-10-TPPS/2_Elan_TrackPoint pointer-accel -0.55

      ### Autostart
      riverctl spawn waybar
      riverctl spawn fcitx5
      riverctl spawn 'gammastep -l 48.85:2.35'
      riverctl spawn rivertile

      ### Scratchpad Tags
      for i in $(seq 1 9)
      do
          tags=$((1 << ($i - 1)))

          riverctl map normal Super $i set-focused-tags $tags

          riverctl map normal Super+Shift $i set-view-tags $tags

          riverctl map normal Super+Shift+Control $i toggle-view-tags $tags

          riverctl map normal Super+Control LEFT spawn
          riverctl map normal Super+Control RIGHT set-focused-tags $($i - 1)
      done

      # Mod+0 to focus all tags
      # Mod+Shift+0 to tag focused view with all tags
      all_tags=$(((1 << 32) - 1))
      riverctl map normal Super 0 set-focused-tags $all_tags
      riverctl map normal Super+Shift 0 set-view-tags $all_tags

      ### Base apps
      riverctl map normal Super Q spawn wezterm
      riverctl map normal Super Return spawn wezterm
      riverctl map normal Super D spawn 'rofi -show drun'
      riverctl map normal Super L spawn swaylock
      riverctl map normal Super C close
      riverctl map normal Super M exit
      riverctl map normal Super V toggle-float

      ### Workspace movement
      riverctl map normal Super+Control Left spawn 'flow cycle-tags previous 9'
      riverctl map normal Super+Control Right spawn 'flow cycle-tags next 9'

      ### Window movement
      riverctl map normal Super+Control H focus-view left
      riverctl map normal Super+Control L focus-view right
      riverctl map normal Super+Control K focus-view up
      riverctl map normal Super+Control J focus-view down

      riverctl map normal Super+Shift H move-view left 100
      riverctl map normal Super+Shift L move-view right 100
      riverctl map normal Super+Shift K move-view up 100
      riverctl map normal Super+Shift J move-view down 100

      ### Fullscreen
      riverctl map normal Super+Control F toggle-fullscreen

      ### Screenshots
      riverctl map normal Super+Control 3 spawn 'grim -g "$(slurp)" - | wl-copy --type image/png'
      riverctl map normal Super+Control 4 spawn 'f=~/Pictures/ss_$(date +%F_%T | tr : -).png; grim -g "$(slurp)" "$f" && wl-copy --type image/png < "$f"'

      ### Mouse drag / resize
      riverctl map-pointer normal Super BTN_LEFT move-view
      riverctl map-pointer normal Super BTN_RIGHT resize-view

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
      riverctl map normal Super+Shift Right spawn 'playerctl next'
      riverctl map normal Super+Shift Down spawn 'playerctl play-pause'
      riverctl map normal Super+Shift Left spawn 'playerctl previous'
    '';
  };
}
