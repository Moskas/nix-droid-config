{ config, lib, pkgs, ... }:

{
  # unstable only
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      manager = {
        sort_dir_first = true;
        show_hidden = false;
      };
    };
  };
}
