{ pkgs, ... }: {

  home.packages = with pkgs; [ cargo rustc rustfmt pkg-config openssl ];

}
