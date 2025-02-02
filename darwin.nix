{ config, pkgs, lib, ... }:

{

  # Use custom location for configuration.nix.
  environment = {
    darwinConfig = "$HOME/.config/darwin.nix";
    systemPackages = [ pkgs.git pkgs.nixfmt-classic pkgs.fira-code ];
    variables.LANG = "en_GB.UTF-8";
  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

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

  # Applications to install from Mac App Store using mas.
  # You need to install all these Apps manually first so that your apple account have records for them.
  # otherwise Apple Store will refuse to install them.
  # For details, see https://github.com/mas-cli/mas
  # masApps = {}; 

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

