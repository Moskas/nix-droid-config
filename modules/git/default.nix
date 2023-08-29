{ config, lib, pkgs, ... }:

{
  imports = [ ./git.nix ./gh.nix ./lazygit.nix ];
}
