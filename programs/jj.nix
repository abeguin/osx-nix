{ pkgs, ... }: {

  programs.jujutsu = {
    enable = true;

    settings = {
      user = {
        name = "Arnaud Fontaine";
        email = "abeguin@kleis.ch";
      };
    };
  };
}
