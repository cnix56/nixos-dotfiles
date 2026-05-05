{
  description = "NixOS from Scratch";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #niri = {
    #  url = "github:sodiboo/niri-flake";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    #noctalia = {
    #  url = "github:noctalia-dev/noctalia-shell";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    nixcord.url = "github:FlameFlag/nixcord";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    #niri = {
    #  url = "github:niri-wm/niri";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi.url = "github:sxyazi/yazi";

    nvf.url = "github:notashelf/nvf";

    #spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    #caelestia-shell = {
    #  url = "github:caelestia-dots/shell";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    #aerothemeplasma-nix = {
    #  url = "github:nyakase/aerothemeplasma-nix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

  };

  #nixConfig = {
  #  extra-substituters = [
  #    "https://noctalia.cachix.org"
  #    "https://attic.xuyh0120.win/lantian"
  #  ];
  #  extra-trusted-public-keys = [
  #    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
  #    "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
  #  ];
  #};

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-flatpak,
      yazi,
      #spicetify-nix,
      nvf,

      ...
    }:
    {
      nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [

          ./modules/nixos/yazi.nix
          nvf.nixosModules.default

          nix-flatpak.nixosModules.nix-flatpak
          #niri.nixosModules.niri
          #{
          #  nixpkgs.overlays = [ niri.overlays.niri ];
          #}

          #inputs.spicetify-nix.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.kevin = ./hosts/workstation/home.nix;
              backupFileExtension = "backup";
            };
          }

          ./hosts/workstation/configuration.nix
          #./modules/nixos/noctalia.nix
        ];
      };
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
          #./modules/nixos/noctalia.nix
          nix-flatpak.nixosModules.nix-flatpak
          nvf.nixosModules.default

          #niri.nixosModules.niri
          #{
          #  nixpkgs.overlays = [ niri.overlays.niri ];
          #}

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.kevin = ./hosts/laptop/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };

    };

}
