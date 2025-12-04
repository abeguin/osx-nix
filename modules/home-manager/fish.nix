{ pkgs, ... }:
let
  localPath = builtins.toPath ./.;
in
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      {
        name = "fish-you-should-use";
        src = pkgs.fishPlugins.fish-you-should-use.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "git-abbr";
        src = pkgs.fishPlugins.git-abbr.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
    shellAbbrs = {
      cat = "bat";
      grep = "rg";
      find = "fd";
      du = "dust";
      br = "broot";
    };
    functions = {
      fish_vcs_prompt = ''
        # If a prompt succeeded, we assume that it's printed the correct info.
        # This is so we don't try svn if git already worked.
        fish_jj_prompt $argv
        or fish_git_prompt $argv
        # or fish_hg_prompt $argv
        # The svn and fossil prompts are disabled by default because they can be quite slow.
        # To enable them uncomment them.
        # You can also only use them in specific directories by checking $PWD.
        # or fish_fossil_prompt $argv
        # or fish_svn_prompt
      '';
      fish_jj_prompt = ''
        if not command -sq jj
            return 1
        end
        set -l info "$(
            jj log 2>/dev/null --no-graph --ignore-working-copy --color=always --revisions @ \
                --template '
                    separate(" ",
                        coalesce(
                            if(!bookmarks, ""),
                            bookmarks.map(|b| b.name()).join(" ")
                        ),
                        change_id.shortest(6),
                        if(description, description.first_line(), label("empty_desc", "(no desc)")),
                        if(empty, label("empty", "(empty)")),
                        if(conflict, label("conflict", "×")),
                        if(divergent, label("divergent", "!")),
                    )
                '
        )"
        or return 1
        if test -n "$info"
            printf ' (%s)' $info
        end
      '';
    };
  };

}
