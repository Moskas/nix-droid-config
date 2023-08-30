{ config, lib, pkgs, ... }:

{
  imports = [
    ./newsboat.nix
    ./exa.nix
    ./zoxide.nix
    ./bat.nix
    ./starship.nix
    ./tmux.nix
  ];
}
