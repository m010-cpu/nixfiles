{
  services.kanshi = {
    enable = true;
    systemdTarget = "river-session.target";
    settings = [
      {
        profile.name = "dock";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
          }
          {
            criteria = "DP-1";
            status = "enable";
            scale = 1.3;
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
