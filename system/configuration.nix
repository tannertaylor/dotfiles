{ config, lib, ... }: with lib; {
  imports = [ 
    ./fonts.nix
    ./packages.nix
    ./virt.nix
    ./desktop.nix
    ./sound.nix
  ];

  options = with options; {
    hostname = mkOption {
      type = types.str;
      description = "The hostname of the NixOS machine";
    };

    headless = mkEnableOption "Headless Configuration";
  };

  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Networking
    networking.hostName = config.hostname;
    networking.networkmanager.enable = true;

    # Bluetooth
    hardware.bluetooth.enable = !config.headless;

    # Time Zone
    time.timeZone = "America/Phoenix";

    # I18N
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    # Keyboard
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.options = "ctrl:nocaps";

    # Printing
    services.printing.enable = !config.headless;

    # Users
    users.users.tanner = {
      isNormalUser = true;
      description = "Tanner Taylor";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
  };
}
