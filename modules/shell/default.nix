{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./newsboat.nix
    ./neofetch.nix
    ./ranger.nix
    ./starship.nix
    ./tickrs.nix
    ./tmux.nix
    ./yazi.nix
    ./zsh.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    jq
    du-dust
    ncurses
    duf
    amfora
    (callPackage ../../pkgs/epy.nix { })
    (callPackage ./check-ssh.nix { })
    (callPackage ./battery.nix { })
    ranger
    onefetch
    xclip
    zip
    unzip
    #unrar
    p7zip
    wget
    nurl
    rates
    ripgrep
  ];
}
