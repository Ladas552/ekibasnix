{ config, lib, pkgs, ...}:

{
# Configure mouse/tablet in x11 
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
}
