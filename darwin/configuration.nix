{ config, pkgs, user, user_uid, hostname, ... }: {

  # MacOS user & shell
  users = {
    knownUsers = [ "${user}" ];
    users."${user}" = {
      name = "${user}";
      home = "/Users/${user}";
      shell = pkgs.fish;
      uid = user_uid;
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
      # ruff
      # python313Packages.python-lsp-ruff
      # basedpyright
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
    #   extra-platforms = x86_64-linux aarch64-linux x86_64-darwin aarch64-darwin
    # '';

    # # Macos Linux builder
    # linux-builder = {
    #   enable = true;
    #   ephemeral = true;
    #   maxJobs = 4;
    #   config = {
    #     virtualisation = {
    #       darwin-builder = {
    #         diskSize = 40 * 1024;
    #         memorySize = 8 * 1024;
    #       };
    #       cores = 6;
    #     };
    #   };
    # };

    settings = {
      trusted-users = [ "root" "${user}" ];
      experimental-features = [ "nix-command" "flakes" ];
    };

    # Nix Store optimisation
    optimise = { automatic = true; };

    # Garbage collection    
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };

  # System Global Configuration
  system = {
    primaryUser = "${user}";

    defaults = {
      NSGlobalDomain = {
        # Locale Configuration
        AppleMeasurementUnits = "Centimeters";
        AppleTemperatureUnit = "Celsius";
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleWindowTabbingMode = "fullscreen";
        NSAutomaticWindowAnimationsEnabled = true;
        NSDocumentSaveNewDocumentsToCloud = false;
      };
      # customize finder
      finder = {
        AppleShowAllExtensions = true; # show all file extensions
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
        AppleShowAllFiles = true;
        FXPreferredViewStyle = "Nlsv"; # default to list view
      };

      # killall Dock to make them have effect
      # https://github.com/LnL7/nix-darwin/blob/master/modules/system/defaults/dock.nix
      dock = {
        autohide = true;
        magnification = true;
        # most recently used spaces
        mru-spaces = false;
        persistent-apps = [
          { app = "/Applications/Arc.app"; }
          { app = "/Applications/IntelliJ IDEA.app"; }
          { app = "/Applications/iTerm.app"; }
          { app = "/Applications/Bitwarden.app"; }
          { spacer = { small = true; }; }
          { app = "/Applications/Microsoft Word.app"; }
          { app = "/Applications/Microsoft Excel.app"; }
          { app = "/Applications/Microsoft PowerPoint.app"; }
          { spacer = { small = true; }; }
          { folder = "/Applications/Utilities"; }
        ];
        tilesize = 48;
      };
    };

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };

  # Allow unfree packages
  nixpkgs = { config.allowUnfree = true; };

  power = {
    sleep = {
      computer = 60;
      display = 5;
      harddisk = 60;
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  services = {
    jankyborders = {
      enable = true;
      active_color = "0xAA00ffff";
      width = 10.0;
    };
  };
}
