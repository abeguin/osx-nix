{  pkgs, ...};

{
  imports = [ <home-manager/nix-darwin> ];

  home-manager.users.abeguin = {

    home.packages = with pkgs; [
      direnv
      jq
      shellcheck
      taskwarrior3
      helix
      tig
      fishPlugins.git-abbr
      gh
      nil
      gopls
      go
    ];

    programs.fish = { enable = true; };

    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = { theme = "flexoki_dark"; };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
          language-servers = [ "nil" ];
        }
        {
          name = "go";
          auto-format = true;
          formatter.command = "${pkgs.go}/bin/go fmt";
          language-servers = [ "gopls" ];
        }
      ];
    };

    programs.git = {
      enable = true;

      userName = "abeguin";
      userEmail = "beguin.arnaud@gmail.com";

      ignores = [ "local" ".DS_STORE" ".idea" ".envrc" ];

      lfs = { enable = true; };

      difftastic = { enable = true; };
    };

    home.stateVersion = "24.11";
  };
}
