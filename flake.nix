{
  description = "My system/user configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = let
      mkNixOSConfig = { hostname, headless ? false, hardwareConfig }: nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          system/configuration.nix
          hardwareConfig
          ({ ... }: { inherit hostname headless; })
        ];
      };
    in {
      personal = mkNixOSConfig {
        hostname = "thinkpadt15";
        hardwareConfig = ./system/thinkpadt15-hardware-configuration.nix;
      };
    };

    homeConfigurations = let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkHMConfig = { headless ? false }: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          user/home.nix
          nixvim.homeManagerModules.nixvim
          ({ ... }: {
            inherit headless;
            username = "tanner";
          })
        ];
      };
    in {
      personal = mkHMConfig { };
      headless = mkHMConfig { headless = true; };
    };
  };
}
