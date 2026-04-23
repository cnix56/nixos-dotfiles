{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  noctalia =
    cmd:
    [
      "noctalia-shell"
      "ipc"
      "call"
    ]
    ++ (pkgs.lib.splitString " " cmd);
in
{

  programs.niri = {

    settings = {

      spawn-at-startup = [
        {
          command = [
            "noctalia-shell"
          ];
        }
      ];

      input = {
        keyboard.repeat-delay = 250;
      };

      binds = with config.lib.niri.actions; {
        #Noctalia stuff
        "Mod+CTRL+X".action.spawn = noctalia "lockScreen lock";
        "Mod+Space".action.spawn = noctalia "launcher toggle";
        "Mod+Comma".action.spawn = noctalia "settings toggle";
        "Mod+Y".action.spawn = noctalia "controlCenter toggle";
        "Mod+C".action.spawn = noctalia "launcher clipboard";
        "Mod+O".action.spawn = noctalia "launcher emoji";
        "Mod+ALT+L".action.spawn = noctalia "lockScreen lock";
        "Mod+M".action.spawn = noctalia "systemMonitor toggle";
        "Mod+X".action.spawn = noctalia "sessionMenu toggle";
        #Launch apps
        "Mod+D".action = toggle-overview;
        "Mod+Return".action.spawn = "alacritty";
        "Mod+B".action.spawn = "brave";
        "Mod+E".action.spawn = "nautilus";
        #Window Management
        "Mod+Q".action = close-window;
        "Mod+Left".action = focus-column-left;
        "Mod+H".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+L".action = focus-column-right;
        "Mod+Up".action = focus-window-up;
        "Mod+K".action = focus-window-up;
        "Mod+Down".action = focus-window-down;
        "Mod+J".action = focus-window-down;

        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+UP".action = move-window-up;
        "Mod+Shift+K".action = move-window-up;
        "Mod+Shift+Down".action = move-window-down;
        "Mod+Shift+J".action = move-window-down;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+CTRL+Home".action = move-column-to-first;
        "Mod+CTRL+End".action = move-column-to-last;

        "Mod+CTRL+Left".action = focus-monitor-left;
        "Mod+CTRL+Right".action = focus-monitor-right;

        "Mod+Shift+CTRL+Left".action = move-column-to-monitor-left;
        "Mod+Shift+CTRL+Right".action = move-column-to-monitor-right;

        "Alt+H".action = consume-or-expel-window-left;
        "Alt+L".action = consume-or-expel-window-right;

        #Workspace Management
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        #Resize windows
        "Mod+F".action = maximize-column;
        #"CTRL+Shift+1".action = [ screenshot ];
        "XF86AudioRaiseVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1+"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1-"
        ];
        "Print".action = screenshot;
      };

      outputs = {
        eDP-1 = {
          enable = false;
        };
        DP-1 = {
          enable = true;
          focus-at-startup = true;
          position = {
            x = 0;
            y = 0;
          };
          mode = {
            width = 2560;
            height = 1440;
            refresh = 240.001;
          };
        };
        DP-2 = {
          enable = true;
          mode = {
            width = 2560;
            height = 1440;
            refresh = 165.080;
          };
          transform = {
            rotation = 270;
          };

        };
      };

      layout = {

        focus-ring = {
          enable = true;
          width = 2;
          active.color = "#b8bb26";
          inactive.color = "#282828";
          urgent.color = "#fb4934";
        };

        border = {
          enable = true;
          width = 2;
          active.color = "#b8bb26";
          inactive.color = "#282828";
          urgent.color = "#fb4934";

        };

        shadow = {
          enable = true;
          color = "#28282870";
        };

        tab-indicator = {
          enable = true;
          corner-radius = 10;
        };

        insert-hint = {
          enable = true;
          display.color = "#b8bb2680";
        };

      };

    };
  };
}
