{ config, pkgs, lib, ... }:
{
#Themes
  gtk = {
    enable = true;
    theme = {
      name = "Graphite-dark";
      package = pkgs.graphite-gtk-theme;
    };
    iconTheme = {
      name = "Candy";
      package = pkgs.candy-icons;
    };
    cursorTheme = {
    name = "Graphite";
    package = pkgs.graphite-cursors;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        '';
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
  programs.gpg.enable = true;

  services.gpg-agent.enable = true;

}
