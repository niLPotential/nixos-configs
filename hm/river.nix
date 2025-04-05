{ lib, config, ... }:
{
  options = {
    river.enable = lib.mkEnableOption "enables river wayland compositor";
  };
  config = lib.mkIf config.river.enable {
    wayland.windowManager.river = {
      enable = true;
      xwayland.enable = false;
      settings = {
        map = {
          normal =
            {
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

              "Super 0" = "set-focused-tags 7";
              "Super+Shift 0" = "set-view-tags 7";
            }
            // builtins.listToAttrs (
              builtins.concatMap
                (i: [
                  {
                    name = "Super ${i}";
                    value = "set-focused-tags ${i}";
                  }
                  {
                    name = "Super+Shift ${i}";
                    value = "set-view-tags ${i}";
                  }
                  {
                    name = "Super+Control ${i}";
                    value = "toggle-focused-tags ${i}";
                  }
                  {
                    name = "Super+Shift+Control ${i}";
                    value = "toggle-view-tags ${i}";
                  }
                ])
                [
                  "1"
                  "2"
                  "4"
                ]
            );
        };
        default-layout = "rivertile";
        focus-follows-cursor = "normal";
        hide-cursor = {
          when-typing = true;
        };
        input = {
          "\\*_Touchpad" = {
            natural-scroll = "disabled";
            tap = "enabled";
          };
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
        border-width = 6;
      };
    };
  };
}
