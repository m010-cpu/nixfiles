{
  pkgs,
  inputs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    # package = inputs.wezterm.packages.${pkgs.system}.default;
    package = pkgs.wezterm;
    enableZshIntegration = false;
    enableBashIntegration = false;
    extraConfig = ''
      return {
        hide_tab_bar_if_only_one_tab = true,
        custom_block_glyphs = false,

        window_decorations = "NONE",
        window_close_confirmation = "NeverPrompt"
      }
    '';
  };
}
