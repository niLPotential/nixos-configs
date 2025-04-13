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
      #     command = "${pkgs.river}/bin/river -c '${pkgs.greetd.regreet}/bin/regreet --log-level trace; riverctl exit'";
      #   };
      # };
    };
    programs.regreet = {
      enable = true;
      # theme.package = pkgs.adw-gtk3;
      theme.name = "adw-gtk3";
    };
    programs.dconf.profiles = {
      user.databases = [
        {
          "/org/gnome/desktop/interface" = {
            "gtk-theme" = "adw-gtk3";
          };
        }
      ];
    };
    stylix.targets.regreet = {
      enable = false;
      useWallpaper = false;
    };
    programs.river = {
      enable = true;
      # xwayland.enable = false;
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
