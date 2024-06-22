{
  description = "My system/user configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.thinkpadt15 = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
      	system/configuration.nix
      ];
      specialArgs = {
        inherit inputs;
        hostname = "thinkpadt15";
      };
    };

    homeConfigurations.tanner = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        user/home.nix
	nixvim.homeManagerModules.nixvim
      ];
      extraSpecialArgs = {
        inherit inputs;
        username = "tanner";
      };
    };
  };
}
