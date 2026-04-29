{
  config,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  #home.packages = with pkgs; [
  #  inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
  #];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };

}
