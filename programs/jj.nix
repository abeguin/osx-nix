{ pkgs, ... }: {

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Arnaud Fontaine";
        email = "abeguin@kleis.ch";
      };
      ui = { pager = "less -FRX"; };
      revsets = { log = "@ | ancestors(remote_bookmarks().., 2) | trunk()"; };
    };
  };

  programs.fish = {
    shellAbbrs = {
      jjla = "jj log -r '@ | ancestors(remote_bookmarks()::, 2) | trunk()::'";
    };
  };
}
