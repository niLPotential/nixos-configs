{ pkgs, lib, config, ... }: {
  options = {
    river.enable = lib.mkEnableOption "enables river wayland compositor";
  };
  config = lib.mkIf config.river.enable {
    services.seatd.enable = true;
    # services.greetd = {
    # enable = true;
    # settings = {
    # default_session = {
    # command = "${pkgs.river}/bin/river -c /etc/greetd/river";
    # user = "greeter";
    # };
    # };
    # };
    # programs.regreet = {
    # enable = false;
    # };
    
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
