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

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
