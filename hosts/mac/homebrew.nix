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
      "nordvpn"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      extraFlags = [ "--force" ];
    };
  };
}
