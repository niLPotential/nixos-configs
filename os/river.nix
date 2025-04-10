{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    river.enable = lib.mkEnableOption "enables river wayland compositor";
  };
  config = lib.mkIf config.river.enable {
    services.seatd.enable = true;
    users.users.greeter = {
      extraGroups = [ "seat" ];
    };
    services.greetd = {
      enable = true;
      greeterManagesPlymouth = true;
      # settings = {
      #   default_session = {
      #     command = "${pkgs.river}/bin/river -c '${pkgs.greetd.regreet}/bin/regreet; riverctl exit'";
      #   };
      # };
    };
    programs.regreet = {
      enable = true;
    };
    programs.dconf = {
      enable = true;
      profiles = {
        kiria = /home/kiria/.config/dconf/user;
      };
    };
    programs.river = {
      enable = true;
      xwayland.enable = false;
      extraPackages = with pkgs; [
        fuzzel
        mako
        waybar
        wob
        wpaperd
      ];
    };
  };
}
