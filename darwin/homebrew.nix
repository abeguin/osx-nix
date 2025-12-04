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
    brews = [ "mas" "bitwarden-cli" "docker-credential-helper" "structurizr-cli" ];

    # cask apps
    casks = [
      "firefox"
      "intellij-idea"
      "arc"
      "bitwarden"
      "rancher"
      "nextcloud"
      "keepassxc"
      "signal"
      "obsidian"
      "tabby"
    ];

  };

}
