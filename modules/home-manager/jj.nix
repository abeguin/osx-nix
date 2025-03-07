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
      git = { push-bookmark-prefix = "abeguin/push-"; };
      fix = {
        tools = {
          python = {
            command = [ "python" "-m black" ];
            patterns = [ "**/*.py" ];
          };
        };
      };
    };
  };

  programs.fish = { shellAbbrs = { jjla = "jj log -r 'all()' -n 15"; }; };
}
