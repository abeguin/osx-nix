{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = { theme = "flexoki_dark"; };

    extraPackages = [ pkgs.tinymist ];

    languages = {
      language-server.tinymist = {
        command = "tinymist";
        config = {
          # exportPdf = "onSave";
          formatterMode = "typstyle";
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
          language-servers = [ "nil" ];
        }
        {
          name = "typst";
          language-servers = [ "tinymist" ];
          auto-format = true;
          formatter = {
            command = "tinymist";
            args = [ "format" "-" ];
          };
        }
      ];

    };

  };
}
