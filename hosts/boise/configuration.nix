{ config, pkgs, nix-colors, nixvim, ... }:

{
  imports = [ ../../modules/services/ssh.nix ../../modules ];

  # Simply install just the packages
  environment.packages = with pkgs; [ ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  user.shell = "${pkgs.zsh}/bin/zsh";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
  '';

  # Set your time zone
  time.timeZone = "Europe/Warsaw";

  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit nix-colors nixvim; };
  };

  system.stateVersion = "23.05";
}
