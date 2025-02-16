{ pkgs, ... }: {

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = { paginate = "never"; };
      user = {
        name = "Arnaud Fontaine";
        email = "afontaine@kleis.ch";
      };
      ui = {
        diff.tool = [ "difft" "--color=always" "$left" "$right" ];
      };
      revsets = { log = "@ | ancestors(remote_bookmarks().., 2) | trunk()"; };
      git = { push-bookmark-prefix = "abeguin/push-"; };
    };
  };

  programs.fish = {
    shellAbbrs = {
      jjla = "jj log -r '@ | ancestors(remote_bookmarks()::, 2) | trunk()::'";
    };
  };
}
