{ pkgs, ... }:
{
  programs.television = {
    enable = true;
    enableFishIntegration = true;
  };
}
