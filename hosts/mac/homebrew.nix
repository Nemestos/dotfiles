{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "shottr"
      "raycast"
      "cursor"
      "vivaldi"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      extraFlags = [ "--force" ];
    };
  };
}