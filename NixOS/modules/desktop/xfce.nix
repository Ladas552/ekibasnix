{ config, lib, pkgs, ...}:

{
  options = {
    xfce.enable = lib.mkEnableOption "enable xfce";
  };

  config = lib.mkIf config.xfce.enable {
# XFCE DE + bspwm and LightDM
    services = {
      displayManager.defaultSession = "xfce+bspwm";
# Enable the X11 windowing system.
      xserver = {
        enable = true;
        desktopManager.xfce = {
          enable = true;
          enableXfwm = false;
        };
        windowManager.bspwm.enable = true;
        desktopManager.xterm.enable = false;
      };
    };
# Exclude some packages
    environment = {
      xfce.excludePackages = with pkgs.xfce; [
        mousepad
          parole
          ristretto
          xfce4-appfinder
          xfce4-screenshooter
          xfce4-taskmanager
          xfce4-terminal 
      ];
      systemPackages = with pkgs.xfce; [
          xfce4-xkb-plugin
          xfce4-timer-plugin
          xfce4-weather-plugin
      ];
    };
  };
}
