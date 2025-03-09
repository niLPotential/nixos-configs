# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;

  networking.hostName = "niX"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Seoul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ko_KR.UTF-8";
    LC_IDENTIFICATION = "ko_KR.UTF-8";
    LC_MEASUREMENT = "ko_KR.UTF-8";
    LC_MONETARY = "ko_KR.UTF-8";
    LC_NAME = "ko_KR.UTF-8";
    LC_NUMERIC = "ko_KR.UTF-8";
    LC_PAPER = "ko_KR.UTF-8";
    LC_TELEPHONE = "ko_KR.UTF-8";
    LC_TIME = "ko_KR.UTF-8";
  };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-hangul
      ];
      waylandFrontend = true;
    };
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = false;
  # services.desktopManager.plasma6.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kiria = {
    isNormalUser = true;
    description = "niLPotential";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.ghostwriter
    ];
  };
  users.defaultUserShell = pkgs.zsh;

  # Install firefox.
  programs.firefox.enable = true;
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
    };
  };
  programs.starship.enable = true;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://storage.matsurihi.me/mltd/card_bg/049mom0584_1.png";
      hash = "sha256-iFtWhrrmgQJ+FYVX14Rt2+Kgj3ajhMJ7u8pP6cF/S2c=";
    };
    # image = pkgs.fetchurl {
    #   url = "https://storage.matsurihi.me/mltd/card_bg/049mom0384_1.png";
    #   hash = "sha256-T0rrI2DsYsrPlN2s0LMhDZP+RQQ8Rp7PgcSkEGv2YJ4=";
    # };
    fonts = {
      monospace = {
        name = "D2Coding ligature";
        package = pkgs.d2coding;
      };
      sansSerif = {
        name = "NanumBarunGothic";
        package = pkgs.nanum;
      };
      serif = {
        name = "NanumMyeongjo";
        package = pkgs.nanum;
      };
    };
  };

  home-manager.backupFileExtension = "backup";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    deno
    geekbench
    gh
    ghostty
    gnomeExtensions.kimpanel
    go
    gotools
    gopls
    helix
    jetbrains.webstorm
    lan-mouse
    nil
    nixpkgs-fmt
    openssl
  ];

  environment.gnome.excludePackages = with pkgs;[
    cheese
    epiphany
    evince
    geary
    gedit
    gnome-calendar
    gnome-clocks
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-terminal
    gnome-text-editor
    gnome-tour
    gnome-weather
    totem
    xterm
  ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "D2Coding ligature" ];
    sansSerif = [ "NanumBarunGothic" ];
    serif = [ "NanumMyeongjo" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
