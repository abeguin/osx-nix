{ pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];
  home-manager.users.afo = {
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
      yq
    ];
    home.stateVersion = "24.11";
    imports = [
      ./programs/direnv.nix
      ./programs/fish.nix
      ./programs/git.nix
      ./programs/helix.nix
    ];
  };

}
