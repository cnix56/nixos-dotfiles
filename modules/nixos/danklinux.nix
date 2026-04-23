{
  config,
  pkgs,
  inputs,
  ...
}:
{

  # Package for running the beta danklinux version

  #environment.systemPackages = with pkgs; [
  #  inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.dms-shell
  #];


  programs.dms-shell = {
    enable = true;
    package = inputs.dms.packages.x86_64-linux.dms-shell;
    quickshell.package = inputs.quickshell.packages.x86_64-linux.quickshell;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting from the clipboard history (wtype)
  };

  
}
