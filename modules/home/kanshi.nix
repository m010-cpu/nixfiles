{
  services.kanshi = {
    enable = true;
    systemdTarget = "sway-session.target";
    settings = [
      {
        profile.name = "dock";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "2953,0"; # 2840/1.3
          }
          {
            criteria = "DP-1";
            status = "enable";
            scale = 1.3;
            position = "0,0";
          }
        ];
      }
      {
        profile.name = "clam";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "DP-1";
            status = "enable";
            scale = 1.3;
          }
        ];
      }
    ];
  };
}
