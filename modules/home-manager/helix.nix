{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "flexoki_dark";
      editor = {
        file-picker = { hidden = false; };
        clipboard-provider.custom = {
          yank = {
            command = "bat";
            args = [ "tests.txt" ];
          };
          paste = {
            command = "bat";
            args = [ "tests.txt" ];
          };
        };
      };

    };
    languages = {
      # language-server.ruff = {
      #   command = "uvx";
      #   args = [ "ruff" "server" ];
      # };
      # language-server.basedpyright = {
      #   command = "uvx";
      #   args = [ "--from" "basedpyright" "basedpyright-langserver" "--stdio" ];
      #   config = { python.pythonPath = ".venv/bin/python"; };
      # };
      # language = [
      #   {
      #     name = "nix";
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
      #     language-servers = [ "nil" ];
      #   }
      #   {
      #     name = "python";
      #     language-id = "python";
      #     auto-format = true;
      #     roots = [ "pyproject.toml" ".git" ".jj" ".venv" ];
      #     file-types = [ ".py" "ipynb" ];
      #     # language-servers = [ "ruff" "basedpyright" ];
      #     formatter = {
      #       command = "uvx";
      #       args = [ "ruff" "format" "-" ];
      #     };
      #   }
      # ];
    };
  };
}
