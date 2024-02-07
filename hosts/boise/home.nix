{ config, pkgs, nix-colors, ... }:

{

  imports =
    [ ../../modules/shell ../../modules/git ../../modules/editors/emacs.nix ];

  #colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  # Read the changelog before changing this value
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    direnv
    neofetch
    onefetch
    ranger
    cargo
    duf
    du-dust
    xmrig
  ];

  # insert home-manager config
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(direnv hook bash)"
      zsh
    '';
  };

  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "emacs";
    initExtra = ''
            eval "$(direnv hook bash)"
      	'';
  };

}
