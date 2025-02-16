{ config, pkgs, lib, ... }:

{

  # Use custom location for configuration.nix.
  environment = {
    darwinConfig = "$HOME/.config/darwin.nix";
    systemPackages =
      [ pkgs.git pkgs.nixfmt-rfc-style pkgs.fira-code pkgs.mas pkgs.docker ];
    variables = {
      LANG = "en_GB.UTF-8";
      EDITOR = "hx";
    };
  };

  # do garbage collection weekly to keep disk usage low
  nix = {
    enable = true;
    extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

    # Macos Linux builder
    # linux-builder.enable = true; # getting a weird error
    settings = {
      trusted-users = [ "@admin" ];
      # # - Replace ${ARCH} with either aarch64 or x86_64 to match your host machine
      # # - Replace ${MAX_JOBS} with the maximum number of builds (pick 4 if you're not sure)
      # builders =
      #   "ssh-ng://builder@linux-builder aarch64-linux /etc/nix/builder_ed25519 8 - - - c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUpCV2N4Yi9CbGFxdDFhdU90RStGOFFVV3JVb3RpQzVxQkorVXVFV2RWQ2Igcm9vdEBuaXhvcwo=";

      # # Not strictly necessary, but this will reduce your disk utilization
      # builders-use-substitutes = true;
    };
    optimise = { automatic = true; };

    # Garbage collection    
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.packages = [ pkgs.fira-code ];

  users = {
    knownUsers = [ "afo" ];
    users.afo = {
      name = "afo";
      home = "/Users/afo";
      shell = pkgs.fish;
      uid = 501;
    };
  };

  programs.fish.enable = true;

  system = {
    defaults = {

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

  imports = [ ./homebrew.nix ./home.nix ];
}

