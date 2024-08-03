{ config, lib, pkgs, ...}:

{
  options = {
    sessions.enable = lib.mkEnableOption "enable sessions";
  };

  config = lib.mkIf config.sessions.enable {
    # XFCE DE + bspwm and LightDM
    services = {
      displayManager.defaultSession = "xfce+bspwm";
      displayManager.sessionPackages = with pkgs; [
        niri
      ];
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
