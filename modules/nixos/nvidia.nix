{ config, pkgs, ... }:
{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    #modesetting.enable = true;
    powerManagement.enable = true;
    videoAcceleration = true;
    #powerManagement.finegrained = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];

  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.dynamicBoost.enable = true;
  powerManagement.enable = true;
  #powerManagement.cpuFreqGovernor = "performance";

# Having both powerManagement.enable and hardware.nvidia.powerManagement.enable 
# as true is required for suspend to work
}
