{ config, lib, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "http://192.168.1.34/atuin/";
      search_mode = "prefix";
      style = "compact";
      history_filter = [ "^z" "^clear" "^exit" ];
    };
  };
}
