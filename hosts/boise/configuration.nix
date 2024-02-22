{ config, pkgs, nix-colors, nixvim, nixvim-config, ... }:

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

  system.stateVersion = "23.05";
}
