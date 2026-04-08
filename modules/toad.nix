# modules/darwin/toad.nix
{ pkgs, lib, user, ... }:

let
  toad = pkgs.writeShellApplication {
    name = "toad";

    runtimeInputs = [ pkgs.uv pkgs.python3 ];

    text = ''
      exec uv tool run --from batrachian-toad==v0.6.14 toad
    '';
  };
in {
  environment.variables = { UV_TOOL_DIR = "/Users/${user}/.cache/uv-tools"; };
  environment.systemPackages = [ toad ];
}
