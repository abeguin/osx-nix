{ git_name, git_email, ... }: {
  programs.git = {
    enable = true;

    userName = "${git_name}";
    userEmail = "${git_email}";

    ignores = [ "local" ".DS_STORE" ".idea" ".envrc" ".helix" ".direnv" ];

    lfs = { enable = true; };

    difftastic = { enable = true; };
  };
}
