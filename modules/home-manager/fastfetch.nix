{ pkgs, ... }: {

  programs.fish = { shellAbbrs = { ff = "fastfetch -l nixos"; }; };
}
