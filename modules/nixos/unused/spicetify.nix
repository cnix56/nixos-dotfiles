{ config, pkgs, inputs, ...}:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in


{

  
programs.spicetify = {
  enable = false;
  theme = spicePkgs.themes.dreary;
  #colorScheme = "Forest";
};
 

  
}