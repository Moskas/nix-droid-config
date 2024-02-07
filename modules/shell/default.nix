{ config, lib, pkgs, ... }:

{
  imports = [
    ./newsboat.nix
    ./exa.nix
    ./zoxide.nix
    ./bat.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    direnv
    neofetch
    onefetch
    ranger
    cargo
    duf
    du-dust
  ];
}
