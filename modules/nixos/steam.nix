{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Install steam
  programs.steam = {
    enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };
}
