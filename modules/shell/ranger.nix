{ pkgs, ...}: {

home.packages = with pkgs; [ ranger ];

xdg.configFile."ranger/rc.conf".text = ''
set vcs_aware true
'';
}
