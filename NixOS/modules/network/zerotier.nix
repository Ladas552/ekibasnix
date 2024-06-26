{ config, lib, pkgs, ...}:

{
  options = {
    zerotier.enable = lib.mkEnableOption "enable zerotier";
  };

  config = lib.mkIf config.zerotier.enable {

    services.zerotierone.enable = true;
   services.zerotierone.joinNetworks = [ ];
    services.zerotierone.localConf = { 
      settings = { 
        softwareUpdate = "disable";
      };
    };
  };
}
