{ lib, config, ... }: {
  options = {
    river.enable = lib.mkEnableOption "enables river wayland compositor";
  };
  config = lib.mkIf config.river.enable {
    wayland.windowManager.river = {
      enable = true;
      xwayland.enable = false;
      settings = {
        map = {
          normal = {
            "Super Q" = "exit";
            "Super F" = "spawn firefox";
            "Super G" = "spawn ghostty";
            "Super Z" = "spawn zeditor";
            "Super Space" = "spawn fuzzel";
          };
        };
        default-layout = "rivertile";
      };
      extraConfig = ''
        rivertile -view-padding 6 -outer-padding 6 &
      '';
    };
  };
}
