{ config, pkgs, user, ... }:

{
  fonts.fontconfig.enable = true;

  home = {
    packages = with pkgs; [
      direnv
      shellcheck
      taskwarrior3
      tig
      gh
      nil
      yq
      jjui
      frogmouth
      yazi
      zellij
      ollama
      nerd-fonts.fira-code
    ];
    username = "${user}";
    homeDirectory = "/Users/${user}";
    stateVersion = "25.05";
  };

  services = { ollama = { enable = true; }; };
  programs = {
    # Better `cat`
    bat.enable = true;
    fzf.enable = true;
    jq.enable = true;
    eza.enable = true;
    fd.enable = true;
    jujutsu.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;
    home-manager.enable = true;
    fastfetch.enable = true;
  };
}
