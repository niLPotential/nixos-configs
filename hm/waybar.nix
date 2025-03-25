{ lib, config, ... }: {
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };
  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      settings.mainBar = {
        layer = "top";
        spacing = 0;
        height = 0;
        margin-top = 8;
        margin-right = 8;
        margin-bottom = 0;
        margin-left = 8;
        modules-left = [ "river/tags" "river/mode" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "battery" ];
        "river/tags" = {
          num-tags = 3;
        };
        clock = {
          format = "{:%H:%M - %a, %d %b %Y}";
          tooltip = false;
        };
        cpu = {
          format = "CPU {usage}%";
        };
        memory = {
          format = "MEM {percentage}%";
        };
        battery = {
          format = "BAT {capacity}%";
        };
      };
      style = ''
        * {
          border: none;
          border-radius: 0;
          margin: 0;
          min-height: 0;
          padding: 0;
        }
        label.module {
          font-size: 12pt;
        }
        .modules-left .module {
          margin: 8px 0px 8px 8px;
        }
        .modules-center .module {
          margin: 8px 0px;
        }
        .modules-right .module {
          margin: 8px 8px 8px 0px;
        }
        #tags button {
          border: 3px solid @base02;
          margin: 0px 4px;
          padding: 0px 8px;
        }
        #tags button.occupied {
          border-color: @base04;
        }
        #tags button.focused {
          border-color: @base0E;
        }
        #clock.module,
        #cpu.module,
        #memory.module,
        #battery.module {
          padding: 8px 12px;
        }
      '';
    };
    stylix.targets.waybar = {
      enableCenterBackColors = true;
      enableLeftBackColors = true;
      enableRightBackColors = true;
      font = "sansSerif";
    };
  };
}
