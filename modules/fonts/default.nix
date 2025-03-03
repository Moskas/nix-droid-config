{ pkgs, ... }: {
  terminal.font = let
    jetbrains = pkgs.nerd-fonts.jetbrains-mono; #pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    fontPath =
      "share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFontMono-Regular.ttf";
  in "${jetbrains}/${fontPath}";
}
