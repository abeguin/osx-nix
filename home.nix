{ pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];
  home-manager.users.afo = {
    home.packages = with pkgs; [
      direnv
      shellcheck
      taskwarrior3
      helix
      tig
      gh
      nil
      yq
    ];

    programs = {
      # Better `cat`
      bat.enable = true;
      fzf.enable = true;
      jq.enable = true;
      # Install btop https://github.com/aristocratos/btop
      btop.enable = true;
      home-manager.enable = true;
    };

    home.stateVersion = "24.11";
    imports = [
      ./programs/direnv.nix
      ./programs/fish.nix
      ./programs/git.nix
      ./programs/helix.nix
    ];
  };

}
