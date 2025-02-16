{ config, pkgs, user, hostname, ... }:

{

  # MacOS user & shell
  users = {
    knownUsers = [ "${user}" ];
    users."${user}" = {
      name = "${user}";
      home = "/Users/${user}";
      shell = pkgs.fish;
      uid = 501;
    };
  };

  # Networking
  networking = {
    computerName = "${hostname}";
    hostName = "${hostname}";
  };

  # Environment variables
  environment = {
    systemPackages = with pkgs; [
      git
      nil
      nixfmt-rfc-style
      nixpkgs-fmt
      mas
      docker
    ];
    variables = {
      LANG = "en_GB.UTF-8";
      EDITOR = "hx";
    };
  };

  # System wide programs
  programs = { fish.enable = true; };

  # Nix Configuration
  # https://mynixos.com/nix-darwin/options/nix
  nix = {
    enable = true;
    package = pkgs.nix;

    # extraOptions = ''
    #   extra-platforms = x86_64-darwin aarch64-darwin
    # '';

    # Macos Linux builder
    # linux-builder.enable = true; # getting a weird error
    settings = {
      trusted-users = [ "root" "${user}" ];
      experimental-features = [ "nix-command" "flakes" ];
      # # - Replace ${ARCH} with either aarch64 or x86_64 to match your host machine
      # # - Replace ${MAX_JOBS} with the maximum number of builds (pick 4 if you're not sure)
      # builders =
      #   "ssh-ng://builder@linux-builder aarch64-linux /etc/nix/builder_ed25519 8 - - - c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUpCV2N4Yi9CbGFxdDFhdU90RStGOFFVV3JVb3RpQzVxQkorVXVFV2RWQ2Igcm9vdEBuaXhvcwo=";

      # # Not strictly necessary, but this will reduce your disk utilization
      # builders-use-substitutes = true;
    };

    # Nix Store optimisation
    optimise = { automatic = true; };

    # Garbage collection    
    gc = {
      automatic = true;
      interval = {
        Hour = 3;
        Minute = 30;
      };
      options = "--delete-older-than 2d";
    };
  };

  # Allow unfree packages
  nixpkgs = { config.allowUnfree = true; };

  # System Global Configuration
  system = {
    defaults = {
      NSGlobalDomain = {
        # Locale Configuration
        AppleMeasurementUnits = "Centimeters";
        AppleTemperatureUnit = "Celsius";
        AppleICUForce24HourTime = true;
      };
      # customize finder
      finder = {
        AppleShowAllExtensions = true; # show all file extensions
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };
    };

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;
}
