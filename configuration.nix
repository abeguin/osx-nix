{ config, pkgs, lib, ... }:


{

  imports = [<home-manager/nix-darwin>];

  # Use custom location for configuration.nix.
  environment.darwinConfig = "$HOME/.config/nix-darwin/configuration.nix";


  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  users.users.abeguin = {
    name = "abeguin";
    home = "/Users/abeguin";
  };

  home-manager.users.abeguin = {
    home.packages = [
      pkgs.git
      pkgs.direnv
      pkgs.jq
      pkgs.shellcheck
      pkgs.taskwarrior3
    ];

    programs.fish = {
      enable = true;
    };

    programs.git = {
      enable = true;

      userName = "abeguin";
      userEmail = "beguin.arnaud@gmail.com";

      ignores = [ 
        "local"
        ".DS_STORE"
        ".idea"
        ".envrc"
      ];

      lfs = {
        enable = true;
      };

      difftastic = {
        enable = true;
      };
    };

    home.stateVersion = "24.11";
  };
  system = {
  defaults = {

    # customize finder
    finder = {
      _FXShowPosixPathInTitle = true;  # show full path in finder title
      AppleShowAllExtensions = true;  # show all file extensions
      QuitMenuItem = true;  # enable quit menu item
      ShowPathbar = true;  # show path bar
      ShowStatusBar = true;  # show status bar
    };

  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  stateVersion = 5;
};
  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;
}
