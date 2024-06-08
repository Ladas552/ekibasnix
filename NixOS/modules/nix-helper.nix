{ config, lib, pkgs, ...}:

{
# nix helper not available in HomeM right now
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.dates = "2 d";
  };
}
