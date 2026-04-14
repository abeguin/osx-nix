{
  inputs = {
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/25.11";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # Flake outputs
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, nix-darwin, ... }:
    let
      user = "afo";
      user_uid = 501;
      system = "aarch64-darwin";
      hostname = "Arnauds-MacBook-Pro";
      git_name = "Arnaud Fontaine";
      git_email = "afontaine@kleis.ch";
    in {
      darwinConfigurations = (import ./darwin {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs nixpkgs-unstable home-manager nix-darwin user user_uid system
          hostname git_name git_email;
      });
    };
}
