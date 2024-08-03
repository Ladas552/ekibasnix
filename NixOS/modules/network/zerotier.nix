{ config, lib, pkgs, ...}:

{
  options = {
    zerotier.enable = lib.mkEnableOption "enable zerotier";
  };

  config = lib.mkIf config.zerotier.enable {

    services.zerotierone = {
      enable = true;
      joinNetworks = [ 
        "$(cat ${config.sops.secrets."mystuff/zero_net_id".path})"
      ];
      localConf = { 
        settings = { 
          softwareUpdate = "disable";
        };
      };
    };
  };
}
