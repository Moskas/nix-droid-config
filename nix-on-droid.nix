{ config, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    neovim
    btop
    nixfmt
    openssh
    curl
    wget
    diffutils
    findutils
    unixtools.ifconfig
    unixtools.whereis
    which
    utillinux
    tzdata
    hostname
    man
    gnugrep
    ripgrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  # Enable openssh
  services.openss.enable = true;

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.05";

  terminal.font =
    "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "Europe/Warsaw";

  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}
