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
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-hangul
        ];
        waylandFrontend = true;
      };
    };
  };
}
