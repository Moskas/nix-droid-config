{ config, lib, pkgs, ... }:

{
  #imports = [ nixvim.homeManagerModules.nixvim ];
  programs.neovim = { enable = true; };
  #home.packages = with pkgs; [ nixvim-config.packages.${system}.default ];
}
