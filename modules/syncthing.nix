{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.syncthing = {
    enable = true;

    settings = {
      devices = {
        "windows" = {
          id = "QUPFHP6Q4OU3I7-7Y22QT2-WUD7BQY-K4JZBDH-NYEP20H-F2NGJ6T-2QFZCAI";
        };
        "android" = {
          id = "TPADN3U-4EY3B2M-PT673ZE-6P3WDMQ-N3NM64Y-HWGYQSN-7AQCCE5-674W4QS";
        };
      };

      folders = {
        "Obsidian" = {
          path = "${config.home.homeDirectory}/Documents/Obsidian";
          devices = [
            "windows"
            "android"
          ];
        };
      };
    };
  };
}
