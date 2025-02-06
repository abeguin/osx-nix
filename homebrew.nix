{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    global = {
      autoUpdate = true;
      brewfile = true;
      lockfiles = true;
    };

    # https://github.com/mas-cli/mas
    masApps = {
      # "Microsoft Excel" = 462058435;
      # "Microsoft PowerPoint" = 462062816;
    };

    # taps
    # taps = [];

    # cellar apps
    brews = [ "mas" "bitwarden-cli" ];

    # cask apps
    casks = [
      "firefox"
      "iterm2"
      "logitech-g-hub"
      "intellij-idea"
      "arc"
      "bitwarden"
      "rancher"
      "nextcloud"
    ];

  };

}
