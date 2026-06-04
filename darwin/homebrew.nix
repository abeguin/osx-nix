{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [ "--verbose" "--force-cleanup" ];
    };

    global = {
      autoUpdate = true;
      brewfile = true;
    };

    # https://github.com/mas-cli/mas
    masApps = {
      # "Microsoft Excel" = 462058435;
      # "Microsoft PowerPoint" = 462062816;
    };

    # taps
    taps = [ ];

    # cellar apps
    brews = [
      "mas"
      "bitwarden-cli"
      "docker-credential-helper"
      "structurizr-cli"
      "glab"
    ];

    # cask apps
    casks = [
      "kitty"
      "microsoft-powerpoint"
      "microsoft-teams"
      "warp"
      "claude"
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
      "windows-app"
    ];

  };

}
