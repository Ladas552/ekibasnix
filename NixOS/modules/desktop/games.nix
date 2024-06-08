{config, lib, pkgs, inputs, ...}:

{
  options = {
    games.enable = lib.mkEnableOption "enable games";
  };

  config = lib.mkIf config.games.enable {

# Genshin Imapct
    programs.anime-game-launcher.enable = true;
# Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
#   extraCompatPackages = [pkgs.proton-ge-bin.steamcompattool];
    };
    hardware.steam-hardware.enable = true;
    environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      heroic
        prismlauncher
        xclicker
        bottles
        steam-run
    ];
  };
}
