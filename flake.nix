{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/25.05";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # Flake outputs
  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, ... }:
    let
      user = "abeguin";
      user_uid = 503;
      system = "x86_64-darwin";
      hostname = "MacBook-Pro-de-Arnaud";
      git_name = "Arnaud Béguin";
      git_email = "abeguin@pictet.com";
      # user = "afo";
      # user_uid = 501;
      # system = "aarch64-darwin";
      # hostname = "Arnauds-MacBook-Pro";
      # git_name = "Arnaud Fontaine";
      # git_email = "afontaine@kleis.ch";
    in {
      darwinConfigurations = (import ./darwin {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager nix-darwin user user_uid system
          hostname git_name git_email;
      });
    };
}
