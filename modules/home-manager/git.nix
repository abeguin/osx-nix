{ ... }: {
  programs.git = {
    enable = true;

    userName = "abeguin";
    userEmail = "beguin.arnaud@gmail.com";

    ignores = [ "local" ".DS_STORE" ".idea" ".envrc" ];

    lfs = { enable = true; };

    difftastic = { enable = true; };
  };
}
