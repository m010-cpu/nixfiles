{
  pkgs-unstable,
  lib,
  ...
}: {
  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
    settings = {
      theme = lib.mkForce "system";
      plugin = [
        "opencode-claude-auth@latest"
        "opencode-gemini-auth@latest"
        "opencode-mystatus"
      ];
      command = {
        mystatus = {
          description = "Query quota usage for all AI accounts";
          template = "Use the mystatus tool to query quota usage. Return the result as-is without modification.";
        };
      };
      mcp = {
        "figma-desktop" = {
          enabled = true;
          type = "remote";
          url = "http://127.0.0.1:3845/mcp";
        };
        "figma-online" = {
          enabled = true;
          type = "remote";
          url = "https://mcp.figma.com/mcp";
        };
      };
    };
  };
}
