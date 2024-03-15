{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Moskas";
    userEmail = "minemoskas@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "master";
        safe.directory = "/mnt/sdcard/Org/";
      };
    };
    aliases = {
      c = "clone";
      ci = "commit";
      co = "checkout";
      s = "status";
      st = "stash";
      a = "add";
      d = "diff";
      p = "push";
      pu = "pull";
    };
  };
}
