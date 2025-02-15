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

    # Macos Linux builder
    linux-builder.enable = true;
    settings = { trusted-users = [ "@admin" ]; };

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

