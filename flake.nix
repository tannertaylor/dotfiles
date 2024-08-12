{
  description = "My user configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    mkHMConfig = { headless ? false }: home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        nixvim.homeManagerModules.nixvim
        ({ ... }: {
          inherit headless;
          username = "tanner";
        })
      ];
    };
  in {
    homeConfigurations = {
      personal = mkHMConfig { };
      headless = mkHMConfig { headless = true; };
    };
  };
}
