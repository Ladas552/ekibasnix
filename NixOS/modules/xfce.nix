{ config, lib, pkgs, ...}:

{
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
  };
}
