{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.dms-plugin-registry.modules.default ];

  programs.dms-shell = {
    enable = true;

    plugins = {
      # Simply enable plugins by their ID (from the registry)
      calculator.enable = true;
      #screenRecorder.enable = true;
      dankPomodoroTimer.enable = true;
      dankDesktopWeather.enable = true;
    };
  };
}
