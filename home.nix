{
  home.username = "kiria";
  home.homeDirectory = "/home/kiria";

  helix.enable = true;
  river.enable = true;


  stylix.enable = true;

  gtk.enable = true;
  qt.enable = true;
  services.mako.enable = true;
  services.wob.enable = true;
  services.wpaperd.enable = true;

  programs.firefox = {
    enable = true;
    # profiles.kiria = {
    #   name = "kiria";
    #   search = {
    #     default = "ddg";
    #   };
    # };
  };
  stylix.targets.firefox = {
    colorTheme.enable = true;
    # profileNames = [ "kiria" ];
  };
  programs.fuzzel.enable = true;
  programs.fzf.enable = true;
  # programs.gh.enable = true;
  programs.ghostty.enable = true;
  programs.git = {
    enable = true;
    userName = "niLPotential";
    userEmail = "niLPotential@proton.me";
  };
  programs.go.enable = true;
  programs.starship = {
    enable = true;
    settings = {
      nodejs.disabled = true;
    };
  };
  programs.waybar.enable = true;
  programs.yazi.enable = true;
  programs.zed-editor.enable = true;
  programs.zoxide.enable = true;
  programs.zsh.enable = true;


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
