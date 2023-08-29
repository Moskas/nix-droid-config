{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Moskas";
    userEmail = "minemoskas@gmail.com";
    extraConfig = { init.defaultBranch = "master"; };
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
