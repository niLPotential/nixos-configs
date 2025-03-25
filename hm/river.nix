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
            "Super Escape" = "exit";
            "Super Q" = "close";
            "Super F" = "spawn firefox";
            "Super G" = "spawn ghostty";
            "Super Z" = "spawn zeditor";
            "Super Space" = "spawn fuzzel";

            "Super H" = "focus-view left";
            "Super J" = "focus-view down";
            "Super K" = "focus-view up";
            "Super L" = "focus-view right";
            "Super N" = "focus-view next";
            "Super P" = "focus-view previous";

            "Super+Shift H" = "swap left";
            "Super+Shift J" = "swap down";
            "Super+Shift K" = "swap up";
            "Super+Shift L" = "swap right";
            "Super+Shift N" = "swap next";
            "Super+Shift P" = "swap previous";

            "Super Return" = "zoom";
          };
        };
        default-layout = "rivertile";
        hide-cursor = {
          when-typing = true;
        };
        rule-add = {
          "-app-id" = {
            "\\*" = "ssd";
          };
        };
        spawn = [
          "waybar"
          "'rivertile -view-padding 4 -outer-padding 4'"
        ];
        extra-commands = ["echo 42"     ];
        border-width = 6;
      };
    };
  };
}
