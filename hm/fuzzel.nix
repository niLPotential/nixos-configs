{ lib, config, ... }: {
  options = {
    fuzzel.enable = lib.mkEnableOption "enables fuzzel";
  };
  config = lib.mkIf config.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          use-bold = "yes";
          hide-before-typing = "yes";
          vertical-pad = 24;
          inner-pad = 8;
          line-height = 16;
        };
        border = {
          width = 3;
          radius = 0;
        };
      };
    };

  };
}
