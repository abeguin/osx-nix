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
      user = "abeguin";
      user_uid = 503;
      system = "aarch64-darwin";
      hostname = "Arnauds-MacBook-Pro";
      git_name = "Arnaud Béguin";
      git_email = "abeguin@pictet.com";
    in {
      darwinConfigurations = (import ./darwin {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs nixpkgs-unstable home-manager nix-darwin user user_uid system
          hostname git_name git_email;
      });
    };
}
