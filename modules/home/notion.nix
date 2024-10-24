{ pkgs, ... }:

{
  xdg.desktopEntries = {
    notion = {
      name = "Notion";
      genericName = "Notes";
      exec = "${pkgs.ungoogled-chromium}/bin/chromium-browser --app=https://notion.so/";
      terminal = false;
      categories = [ "Utility" ];
      startupNotify = true;
    };
  };
}
