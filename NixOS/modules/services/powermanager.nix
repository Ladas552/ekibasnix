{ config, lib, pkgs, ...}:
{
  options = {
    powermanager.enable = lib.mkEnableOption "enable powermanager";
  };

  config = lib.mkIf config.powermanager.enable {
    powerManagement.enable = true;
    services.tlp.enable = true;
  };
}
