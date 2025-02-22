{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # Flake outputs
  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, ... }:
    let
      user = "afo";
      user_uid = 501;
      system = "aarch64-darwin"; # x86_64-darwin
      hostname = "Arnauds-MacBook-Pro";
      git_name = "Arnaud Fontaine";
      git_email = "afontain@kleis.ch";
    in {
      darwinConfigurations = (import ./darwin {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager nix-darwin user user_uid system
          hostname git_name git_email;
      });
    };
}
