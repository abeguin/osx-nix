{ lib, inputs, nixpkgs, home-manager, nix-darwin, user, ... }:

let
  # Darwin Architecture
  # System Options: [ "aarch64-darwin" "x86_64-darwin" ]
  system = "aarch64-darwin";

  # Hostname
  hostname = "Arnauds-MacBook-Pro";
in {
  # MacBook Pro
  "${hostname}" = nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs user hostname; };
    modules = [
      # MacBook Pro Configuration
      ./configuration.nix
      ./homebrew.nix

      # Home Manager
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = {
          imports = [ (import ./home.nix) ]
            ++ [ (import ../modules/home-manager/direnv.nix) ]
            ++ [ (import ../modules/home-manager/fastfetch.nix) ]
            ++ [ (import ../modules/home-manager/fish.nix) ]
            ++ [ (import ../modules/home-manager/git.nix) ]
            ++ [ (import ../modules/home-manager/helix.nix) ]
            ++ [ (import ../modules/home-manager/jj.nix) ];
        };
      }
    ];
  };
}
