{pkgs, ...}: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-mozc
      qt6Packages.fcitx5-chinese-addons
    ];
  };
}
