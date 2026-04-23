{
  config,
  pkgs,
  inputs,
  ...
}:

#Bleeding edge Niri
{

  environment.systemPackages = with pkgs; [
    #  inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri
    xwayland-satellite
  ];

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri;
  };

  # Add a desktop portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];
}
