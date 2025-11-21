{ git_name, git_email, ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = "${git_name}";
      email = "${git_email}";
    };

    ignores = [ "local" ".DS_STORE" ".idea" ".envrc" ".helix" ".direnv" ];

    lfs = { enable = true; };

  };
  programs.difftastic.enable = true;
}
