_:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      format = "$directory$git_branch$git_status$character";

      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = " ";
        style = "bold yellow";
      };

      git_status = {
        style = "bold red";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}
