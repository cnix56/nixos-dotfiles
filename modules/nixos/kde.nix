{
  config,
  pkgs,
  inputs,
  ...
}:


{
  
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true; # required

}
