{ git_name, git_email, ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "${git_name}";
        email = "${git_email}";
      };
    };

    ignores =
      [ "local" ".DS_STORE" ".idea" ".envrc" ".helix" ".direnv" "*.iml" ];

    lfs = { enable = true; };

  };
  programs.difftastic.enable = true;
}
