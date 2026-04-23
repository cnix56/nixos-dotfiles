{
  config,
  pkgs,
  inputs,
  ...
}:
{
  # Enable Flatpak

  services.flatpak.enable = true;

  # Configure the beta flatpak repo
  services.flatpak.remotes = [
    #{
    #  name = "flathub-beta";
    #  location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    #}
    {
      name = "flathub";
      location = "https://flathub.org/repo/flathub.flatpakrepo";

    }
  ];

  # Install flatpak packages
  services.flatpak.packages = [
    {
      appId = "org.prismlauncher.PrismLauncher";
      origin = "flathub";
    } 
  ];
}
