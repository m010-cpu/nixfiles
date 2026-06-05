{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    events = {
      before-sleep = "swaylock -fF";
    };
    timeouts = [
      {
        timeout = 240;
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      {
        timeout = 300;
        command = "swaylock -fF";
      }
      {
        timeout = 900;
        command = "systemctl suspend";
      }
    ];
  };
}
