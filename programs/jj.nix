{ pkgs, ... }: {

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = { paginate = "never"; };
      user = {
        name = "Arnaud Fontaine";
        email = "afontaine@kleis.ch";
      };
      revsets = { log = "@ | ancestors(remote_bookmarks().., 2) | trunk()"; };
    };
  };

  programs.fish = {
    shellAbbrs = {
      jjla = "jj log -r '@ | ancestors(remote_bookmarks()::, 2) | trunk()::'";
    };
  };
}
