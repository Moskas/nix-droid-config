{ config, pkgs, ... }:

{
  imports = [ ./emacs.nix ./neovim.nix ];
}
