{ config, lib, pkgs, ...}:

{

imports = [
./defaultc.nix
./desktop/otd.nix
./desktop/xfce.nix
./desktop/fonts.nix
./desktop/games.nix
./desktop/lightdm.nix
./desktop/stylix.nix
./network/openssh.nix
./network/zerotier.nix
./network/bluetooth.nix
./services/sound.nix
./services/clamav.nix
./services/plymouth.nix
./services/printers.nix
./services/nix-helper.nix
./services/virtualisation.nix
];

defaultc.enable = lib.mkDefault true;
nix-helper.enable = lib.mkDefault true;
fonts.enable = lib.mkDefault true;
sounds.enable = lib.mkDefault true;
}
