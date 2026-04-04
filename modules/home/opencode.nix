{
  pkgs,
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
        "opencode-claude-auth"
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
        "chrome" = {
          enabled = true;
          type = "local";
          command = ["npx" "-y" "chrome-devtools-mcp@latest" "--no-usage-statistics" "--isolated" "--executable-path" (lib.getExe pkgs.ungoogled-chromium)];
        };
        "ida-pro-mcp" = {
          enabled = true;
          type = "local";
          command = ["uvx" "ida-pro-mcp"];
        };
        "ghidra" = {
          enabled = true;
          type = "local";
          command = ["python" "${../../mcp/ghidra/bridge_mcp_ghidra.py}" "--ghidra-server" "http://127.0.0.1:8080"];
        };
        "burp" = {
          enabled = true;
          type = "remote";
          url = "http://127.0.0.1:9876";
        };
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
