{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/hosts/workstation/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    fastfetch = "fastfetch";
    alacritty = "alacritty";
    niri = "niri";
    noctalia = "noctalia";
    DankMaterialShell = "DankMaterialShell";
    hypr = "hypr";
    kitty = "kitty";

  };
in
{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";
  home.stateVersion = "25.11";

  imports = [
    #../../modules/home-manager/noctalia.nix
    #./modules/home-manager/niri.nix
    ../../modules/home-manager/nixcord.nix
    ../../modules/home-manager/gtk.nix
    #../../modules/home-manager/caelestia.nix
    ../../modules/home-manager/git.nix
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };


  xdg.desktopEntries.whatsapp = {
    name = "WhatsApp";
    exec = "${lib.getExe pkgs.brave} --app=https://web.whatsapp.com";
  };


  

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "nitch";

    shellAliases = {
      btw = "echo I use nixos, btw";
      update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/#workstation";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  #xdg.configFile."fastfetch" = {
  #  source = create_symlink "${dotfiles}/fastfetch";
  #  recursive = true;
  #};

  # Iterate over xdg config files and map them accordingly
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  

}
