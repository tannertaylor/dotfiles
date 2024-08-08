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
    nixosConfigurations.thinkpadt15 = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ system/configuration.nix ];
      specialArgs = { hostname = "thinkpadt15"; };
    };

    homeConfigurations = let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkHMConfig = { headless }: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          user/home.nix
          nixvim.homeManagerModules.nixvim
          ({ ... }: { headless = headless; })
        ];
        extraSpecialArgs = { username = "tanner"; };
      };
    in {
      personal = mkHMConfig { headless = false; };
      headless = mkHMConfig { headless = true; };
    };
  };
}
