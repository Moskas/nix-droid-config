{ config, lib, pkgs, ... }:

{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    reloadThreads = 8;
    extraConfig = ''
      bind-key RIGHT open
      bind-key LEFT quit

      bind-key l open
      bind-key j down
      bind-key k up
      bind-key h quit
    '';
  };
}
