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
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      extraFlags = [ "--force" ];
    };
  };
}
