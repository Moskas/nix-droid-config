{ config, lib, pkgs, ... }:

{
  imports = [
    ./newsboat.nix
    ./eza.nix
    ./fzf.nix
    ./zoxide.nix
    ./bat.nix
    ./starship.nix
    ./tickrs.nix
    ./ranger.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    direnv
    nix-direnv
    neofetch
    onefetch
    duf
    du-dust
    lutgen
    ncurses
    (callPackage ../../pkgs/epy.nix { })
  ];
}
