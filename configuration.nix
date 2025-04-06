# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;

  boot.initrd.luks.devices."luks-344de576-a8ad-43ba-bbee-ad8c8a25b4d2".device =
    "/dev/disk/by-uuid/344de576-a8ad-43ba-bbee-ad8c8a25b4d2";
  networking.hostName = "niX"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  korean.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kiria = {
    isNormalUser = true;
    description = "niLPotential";
    extraGroups = [
      "networkmanager"
      "wheel"
      "seat"
      "input"
    ];
    packages = with pkgs; [
      kdePackages.ghostwriter
      lan-mouse
    ];
  };
  users.defaultUserShell = pkgs.zsh;

  river.enable = true;
  stylixModule.enable = true;
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
    };
  };
  programs.starship = {
    enable = true;
    presets = [
      "no-nerd-font"
    ];
  };
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager.backupFileExtension = "backup";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "D2Coding ligature" ];
    sansSerif = [ "NanumBarunGothic" ];
    serif = [ "NanumMyeongjo" ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
