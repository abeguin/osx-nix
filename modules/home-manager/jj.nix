{ git_name, git_email, ... }: {

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = { paginate = "never"; };
      user = {
        name = "${git_name}";
        email = "${git_email}";
      };
      ui = { diff.tool = [ "difft" "--color=always" "$left" "$right" ]; };
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
