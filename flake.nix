{
  description =
    "Advanced example of Nix-on-Droid system config with home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nix-on-droid
    , nixvim, nix-colors, ... }@inputs:
    let
      pkgs = import nixpkgs {
        system = "aarch64-linux";
        overlays = [ nix-on-droid.overlays.default ];
      };
      colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
    in {

      nixOnDroidConfigurations = {
        boise = nix-on-droid.lib.nixOnDroidConfiguration {
          modules = [
	  	./hosts/boise/configuration.nix
	  	nix-colors.homeManagerModules.default
	  ];
          extraSpecialArgs = { inherit nixvim pkgs nix-colors colorScheme; };
          home-manager-path = home-manager.outPath;
        };
	dewey = nix-on-droid.lib.nixOnDroidConfiguration {
          modules = [ ./hosts/dewey/configuration.nix ];
          extraSpecialArgs = { inherit nixvim pkgs nix-colors; };
          home-manager-path = home-manager.outPath;
        };
      };
    };
}
