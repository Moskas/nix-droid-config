{ config, lib, pkgs, ... }:

{

  imports = [ ../../modules/shell ../../modules/git ../../modules/editors ];
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

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29;
    extraPackages = epkgs: with epkgs; [ vterm-toggle ];
  };
}
