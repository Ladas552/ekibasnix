{ config, lib, pkgs, ...}:

{

  imports = [
    ./defaultc.nix
    ./desktop/fonts.nix
    ./desktop/games.nix
    ./desktop/lightdm.nix
    ./desktop/otd.nix
    ./desktop/sessions.nix
    ./network/bluetooth.nix
    ./network/openssh.nix
    ./network/zerotier.nix
    ./services/clamav.nix
    ./services/nix-helper.nix
    ./services/plymouth.nix
    ./services/printers.nix
    ./services/sound.nix
    ./services/virtualisation.nix
    ./secrets/sops.nix
    ./services/ld-nix.nix
  ];

  defaultc.enable = lib.mkDefault true;
  nix-helper.enable = lib.mkDefault true;
  fonts.enable = lib.mkDefault true;
  sounds.enable = lib.mkDefault true;
  secrets.enable = lib.mkDefault true;
}
