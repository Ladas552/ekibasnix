{ config, lib, pkgs, ...}:

{
  options = {
    zerotier.enable = lib.mkEnableOption "enable zerotier";
  };

  config = lib.mkIf config.zerotier.enable {

    services.zerotierone.enable = true;
    services.zerotierone.joinNetworks = [ 
      "$(cat ${config.sops.secrets."mystuff/zero_net_id".path})"
    ];
    services.zerotierone.localConf = { 
      settings = { 
        softwareUpdate = "disable";
      };
    };
  };
}
