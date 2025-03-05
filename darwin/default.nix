{ lib, inputs, nixpkgs, nixpkgs-unstable, home-manager, nix-darwin, user, user_uid, system
, hostname, git_name, git_email, ... }:
let
  pkgs-unstable = import nixpkgs-unstable { system = system; config.allowUnfree = true; };
in
{
  # MacBook Pro
  "${hostname}" = nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs user user_uid hostname pkgs-unstable; };
    modules = [
      # MacBook Pro Configuration
      ./configuration.nix
      ./homebrew.nix

      # Home Manager
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user git_name git_email pkgs-unstable; };
        home-manager.users.${user} = {
          imports = [ (import ./home.nix) ]
            ++ [ (import ../modules/home-manager/direnv.nix) ]
            ++ [ (import ../modules/home-manager/fastfetch.nix) ]
            ++ [ (import ../modules/home-manager/fish.nix) ]
            ++ [ (import ../modules/home-manager/git.nix) ]
            ++ [ (import ../modules/home-manager/helix.nix) ]
            ++ [ (import ../modules/home-manager/jj.nix) ]
            ++ [ (import ../modules/home-manager/zellij.nix) ]
            ++ [ (import ../modules/home-manager/jjui.nix) ]
            ++ [ (import ../modules/home-manager/eza.nix) ]
            ++ [ (import ../modules/home-manager/yazi.nix) ];
            ++ [ (import ../modules/home-manager/yazi.nix) ]
            ++ [ (import ../modules/home-manager/isync.nix) ];
        };
      }
    ];
  };
}
