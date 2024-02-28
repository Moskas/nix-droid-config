{ pkgs, nix-colors, nixvim, nixvim-config, ... }:

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

  # Setting terminal colors 
  terminal.colors = {
    "foreground" = "#${nix-colors.config.colorScheme.palette.base06}";
    "background" = "#${nix-colors.config.colorScheme.palette.base00}";
    "color0" = "#${nix-colors.config.colorScheme.palette.base03}";
    "color1" = "#${nix-colors.config.colorScheme.palette.base08}";
    "color2" = "#${nix-colors.config.colorScheme.palette.base0B}";
    "color3" = "#${nix-colors.config.colorScheme.palette.base0A}";
    "color4" = "#${nix-colors.config.colorScheme.palette.base0D}";
    "color5" = "#${nix-colors.config.colorScheme.palette.base0E}";
    "color6" = "#${nix-colors.config.colorScheme.palette.base0C}";
    "color7" = "#${nix-colors.config.colorScheme.palette.base06}";
    "color8" = "#${nix-colors.config.colorScheme.palette.base03}";
    "color9" = "#${nix-colors.config.colorScheme.palette.base08}";
    "color10" = "#${nix-colors.config.colorScheme.palette.base0B}";
    "color11" = "#${nix-colors.config.colorScheme.palette.base0A}";
    "color12" = "#${nix-colors.config.colorScheme.palette.base0D}";
    "color13" = "#${nix-colors.config.colorScheme.palette.base0E}";
    "color14" = "#${nix-colors.config.colorScheme.palette.base0C}";
    "color15" = "#${nix-colors.config.colorScheme.palette.base07}";
  };

  system.stateVersion = "23.05";
}
