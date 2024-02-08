{ pkgs, ... }: {
  terminal.font = let
    jetbrains = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    fontPath =
      "share/fonts/truetype/NerdFonts/JetBrainsMonoNerdFontMono-Regular.ttf";
  in "${jetbrains}/${fontPath}";
}
