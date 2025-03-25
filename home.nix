{
  home.username = "kiria";
  home.homeDirectory = "/home/kiria";

  firefox.enable = true;
  fuzzel.enable = true;
  helix.enable = true;
  river.enable = true;
  waybar.enable = true;
  zed-editor.enable = false;


  stylix.enable = true;

  gtk.enable = true;
  qt.enable = true;
  services.mako.enable = true;
  services.wob.enable = true;
  services.wpaperd.enable = true;

  programs.fzf.enable = true;
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
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
  programs.yazi.enable = true;
  programs.zoxide.enable = true;
  programs.zsh.enable = true;


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
