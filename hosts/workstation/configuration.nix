{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/gamesDrive.nix
    ../../modules/nixos/flatpak.nix
    ../../modules/nixos/danklinux.nix
    ../../modules/nixos/steam.nix
    ./dankgreeter.nix
    ../../modules/nixos/hyprland.nix
    #../../modules/nixos/aerothemeplasma.nix
    ../../modules/nixos/spicetify.nix
    #../../modules/nixos/caelestia.nix
    ../../modules/nixos/vscode.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v3;

  networking.hostName = "workstation"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the ly display manager
  #services.displayManager.ly.enable = true;
  #qt.enable = true;
  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";

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
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Set default shell to zsh
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kevin = {
    isNormalUser = true;
    description = "kevin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
  };



  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    micro
    nixfmt
    alacritty
    fastfetch
    cmatrix
    alacritty
    brave
    nautilus
    gnome-text-editor
    nwg-look
    ddcutil
    telegram-desktop
    btop
    obsidian
    protonup-qt
    ntfs3g
    prismlauncher
    nvtopPackages.nvidia
    thunar
    proton-vpn
    stremio-linux-shell
    nitch
    mesa-demos
    libva-utils
    qbittorrent
    papirus-icon-theme
    gnome-calculator
    kdePackages.dolphin
    superfile
    lf
    ueberzugpp
    ghostty
    eog
    kdePackages.breeze
    papers
    slurp
    grim
    dunst
    uwsm
    qutebrowser
    kitty
    wget
    spotify
    gpu-screen-recorder
    vlc
    signal-desktop
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "25.11";

}
