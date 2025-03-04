{ config, pkgs, ... }:

{
  imports = [ ./fonts ];

  environment.packages = with pkgs; [
    nixfmt-rfc-style
    procps
    killall
    openssh
    mosh
    curl
    wget
    coreutils
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
}
