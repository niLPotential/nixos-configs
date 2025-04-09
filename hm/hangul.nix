{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    hangul.enable = lib.mkEnableOption "Enable Hangul input via fcitx5";
  };
  config = lib.mkIf config.hangul.enable {
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-hangul
        ];
        waylandFrontend = true;
      };
    };
    systemd.user.sessionVariables = {
      QT_IM_MODULE = "fcitx";
      GTK_IM_MODULE = "fcitx";
    };
  };
}
