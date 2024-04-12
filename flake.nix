{
  description =
    "Advanced example of Nix-on-Droid system config with home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/testing";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-config = {
      url = "github:Moskas/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

  };

  outputs = { self, nixpkgs, home-manager, nix-on-droid, nixvim, nixvim-config
    , nix-colors, ... }@inputs:
    let
      pkgs = import nixpkgs {
        system = "aarch64-linux";
        overlays = [ nix-on-droid.overlays.default ];
      };

    in {
      nixOnDroidConfigurations = {
        boise = nix-on-droid.lib.nixOnDroidConfiguration {
          modules = [
            ./hosts/boise/configuration.nix
            #inputs.nixvim.nixosModules.nixvim
            {
              home-manager = {
                config = ./hosts/boise/home.nix;
                backupFileExtension = "hm-bak";
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit nix-colors nixvim; };
              };
            }
          ];
          extraSpecialArgs = { inherit pkgs nixvim nixvim-config nix-colors; };
          home-manager-path = home-manager.outPath;
        };
        dewey = nix-on-droid.lib.nixOnDroidConfiguration {
          modules = [
            ./hosts/dewey/configuration.nix
            {
              home-manager = {
                config = ./hosts/dewey/home.nix;
                backupFileExtension = "hm-bak";
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit nix-colors nixvim nixvim-config; };
              };
            }
          ];
          extraSpecialArgs = { inherit nixvim pkgs nix-colors; };
          home-manager-path = home-manager.outPath;
        };
      };
    };

}
