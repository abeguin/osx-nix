{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [ "--verbose" ];
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
    brews = [ "mas" "docker-credential-helper" ];

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
      "keepassxc"
      "microsoft-excel"
      "microsoft-word"
      "microsoft-powerpoint"
      "signal"
      "android-studio"
      "google-chrome"
    ];

  };

}
