{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "shottr"
      "raycast"
      "cursor"
      "vivaldi"
      "ultimaker-cura"
      "discord"
      "obsidian"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      extraFlags = [ "--force" ];
    };
  };
}
