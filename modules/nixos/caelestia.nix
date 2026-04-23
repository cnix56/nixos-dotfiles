{config, pkgs, inputs, ...}:
{

  environment.systemPackages = with pkgs; [
    inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}