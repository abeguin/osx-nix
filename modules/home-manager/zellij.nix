{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-macchiato";
      default_shell = "fish";
      # mouse_mode = false;
      copy_command = "pbcopy";
    };
  };
}
