{
  config,
  pkgs,
  inputs,
  ...
}:

{
  gtk = {
    enable = true;
    gtk4.theme = null;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

}
