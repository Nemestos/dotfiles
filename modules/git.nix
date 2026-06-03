_:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Léo Turpin";
      user.email = "pro@leoturpin.fr";

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "nvim";
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";

      alias = {
        a = "add";
        c = "commit";
        cm = "commit -m";
        p = "push";
        l = "pull";
        st = "status -sb";
        co = "checkout";
        d = "diff";
        br = "branch";
        lg = "log --oneline --graph --decorate --all";
        undo = "reset --soft HEAD~1";
      };
    };

    ignores = [
      ".DS_Store"
      "*.swp"
      ".direnv"
      ".envrc"
    ];
  };
}
