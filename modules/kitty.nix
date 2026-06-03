_:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Hack Nerd Font Mono";
      size = 13;
    };

    settings = {
      window_padding_width = 8;
      hide_window_decorations = "titlebar-only";

      cursor_shape = "beam";
      cursor_blink_interval = 0;

      enable_audio_bell = false;
      copy_on_select = "clipboard";
      shell = "/run/current-system/sw/bin/fish";

    };

    themeFile = "gruvbox-dark";
  };
}
