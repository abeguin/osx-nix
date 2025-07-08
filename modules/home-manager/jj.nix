{ git_name, git_email, ... }: {

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = { paginate = "never"; };
      user = {
        name = "${git_name}";
        email = "${git_email}";
      };
      ui = {
        diff-formatter = [ "difft" "--color=always" "$left" "$right" ];
        merge-editor = "mergiraf";
      };
      templates = {
        git_push_bookmark = "'abeguin/push-' ++ change_id.short()";
      };
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
