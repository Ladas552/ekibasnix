{ config, pkgs, inputs, ... }:

{
	services.syncthing = {
		enable = true;
		tray = true;
	};
	programs.firefox.enable = true;
	programs.librewolf.enable = true;
}
