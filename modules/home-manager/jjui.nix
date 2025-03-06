{ ... }: {
  programs.fish = { shellAbbrs = { j = "jjui $(jj workspace root)"; }; };
}
