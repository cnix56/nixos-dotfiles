{
  config,
  pkgs,
  inputs,
  ...
}:

 # Setting this up will mess with GTK apps fonts. Make sure to remember the previous font

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true; # required
  services.displayManager.defaultSession = "aerothemeplasma";

  programs.aeroshell = {
    enable = true; # required
    #fonts.enable = true; # font files needed
    polkit.enable = true;
    aerothemeplasma = {
      enable = true; # required
      sddm.enable = true;
      #plymouth.enable = true; # font files needed
    };
  };
}
