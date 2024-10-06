{ config, lib, ... }: {
  imports = [
    # config/neovim/neovim.nix
    config/yazi/yazi.nix
  ];

  options = with lib.options; {
    headless = mkEnableOption "headless configuration";
    username = mkOption {
      type = lib.types.str;
      description = "my username";
    };
  };

  config = {
    home = {
      username = config.username;
      homeDirectory = "/home/${config.username}";
      stateVersion = "24.05";
    };

    nix.registry.dev = {
      from = {
        type = "indirect";
        id = "dev";
      };

      to = {
        type = "github";
        owner = "tannertaylor";
        repo = "devflakes";
      };
    };
  };
}
