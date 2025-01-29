{ config, pkgs, lib, ... }:

{

  imports = [ <home-manager/nix-darwin> ];

  # Use custom location for configuration.nix.
  environment = {
    darwinConfig = "$HOME/.config/nix-darwin/configuration.nix";
    systemPackages = [ pkgs.git pkgs.nixfmt-classic ];
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

  users = {
    knownUsers = [ "abeguin" ];
    users.abeguin = {
      name = "abeguin";
      home = "/Users/abeguin";
      shell = pkgs.fish;
      uid = 503;
    };
  };

  programs.fish.enable = true;

  home-manager.users.abeguin = {

    home.packages = with pkgs; [
      direnv
      jq
      shellcheck
      taskwarrior3
      helix
      tig
      fishPlugins.git-abbr
    ];

    programs.fish = { enable = true; };

    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = { theme = "flexoki_dark"; };
    };

    programs.git = {
      enable = true;

      userName = "abeguin";
      userEmail = "beguin.arnaud@gmail.com";

      ignores = [ "local" ".DS_STORE" ".idea" ".envrc" ];

      lfs = { enable = true; };

      difftastic = { enable = true; };
    };

    home.stateVersion = "24.11";
  };

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    # taps
    # taps = [];

    # cellar apps
    # brews = [];

    # cask apps
    casks = [ "firefox" "iterm2" ];

  };

  # Applications to install from Mac App Store using mas.
  # You need to install all these Apps manually first so that your apple account have records for them.
  # otherwise Apple Store will refuse to install them.
  # For details, see https://github.com/mas-cli/mas
  # masApps = {}; 

  system = {
    defaults = {

      # customize finder
      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
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
