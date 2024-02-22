{ config, lib, pkgs, nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/shell
    ../../modules/git
    ../../modules/editors
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  # Read the changelog before changing this value
  home.stateVersion = "23.05";

  home.packages = with pkgs; [ ];

  # insert home-manager config
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';
  };

  programs.zsh = { enable = true; };
}
