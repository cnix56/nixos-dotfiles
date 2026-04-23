{
  config,
  pkgs,
  inputs,
  ...
}:
{

  services.displayManager.dms-greeter = {
    enable = true;
    compositor = {
      name = "niri"; # Or "hyprland" or "sway"
      customConfig = ''
                output "eDP-1" {
            mode "1920x1080@60"
            scale 1.25
            position x=0 y=0
        }

        hotkey-overlay {
    skip-at-startup
    }
	 '';
    };
    configHome = "/home/kevin";

  };
}
