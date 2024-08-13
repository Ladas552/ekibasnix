{config, lib, pkgs, inputs, nix-minecraft, ...}:

{
  options = {
    minecraft.enable = lib.mkEnableOption "enable minecraft";
  };

  config = lib.mkIf config.minecraft.enable {
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
    services.minecraft-servers = {
      enable = true;
      eula = true;

      servers = {
        nix-minerraria = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_1;

          serverProperties = {
            gamemode = "survival";
            difficulty = "normal";
            simulationDistance = 10;
            view-distance = 8;
            online-mode = false;
            motd = "I booted this server at 3 am, have fun";
          };
          symlinks = {
            "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
              FallingTree = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Fb4jn8m6/versions/uni2ZHB8/FallingTree-1.21-1.21.0.7.jar"; sha512 = "1x75x9skh8hqb2dri3fkss631ah00yzjhahx0plnxm6892768m4dqx9gbf81afxpj41c0zcil0mpqvjphn34gqaxy9qckp8lvi3p0j3"; };
          #     Monsters-in-the-closet = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/GMA8jFBD/versions/iBLoBKBc/monsters-in-the-closet-1.0.3+1.21.jar"; sha512 = "05mdgq1l18f4w8prflyrll6856kink9zjl061g8k0bibhmarzgn1"; };
          #     RightClickHarvest = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Cnejf5xM/versions/G8rHINcW/rightclickharvest-fabric-4.3.1+1.21.jar"; sha512 = "1npw0ac33db6n393ij2j5f3qnh756d0jv68imvdiyfy5a61lrpv0"; };
          #     Fabric-API = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/oGwyXeEI/fabric-api-0.102.0+1.21.jar"; sha512 = "09iz3b3bwda6sy62j56fxavin8d845wlha03xphpz5bp3shybh3y"; };
          #     cloth-config = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/9s6osm5g/versions/7jtvrmVP/cloth-config-15.0.130-fabric.jar"; sha512 = "0h5mbjb2lm9257624mamzsprx9fia937pf39mfckffxsdwnsgmbr"; };
          #     Lithium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/NTZCh7rb/lithium-fabric-mc1.21-0.13.0.jar"; sha512 = "141ysxkrqszd2v5jhwxbdln267rdd0fb47zidbqm35fwpcnahh4s"; };
          #     FerriteCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/wmIZ4wP4/ferritecore-7.0.0-fabric.jar"; sha512 = "08q3cs3z97i4z3f4idf4c3hf2dh640wksk6wbv7s7rjx3w6j0c9c"; };
          #     AppleSkin = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/EsAfCjCV/versions/fG1xJao0/appleskin-fabric-mc1.21-3.0.5.jar"; sha512 = "1k7yvc9qhyhmcfsaqi3i57zik6hac25ji82n82hwwwxkz8qklkzk"; };
          #     Krypton = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/Acz3ttTp/krypton-0.2.8.jar"; sha512 = "1zp394pvrdmsk380zzz8fp63cj6qrlaxmjgxxxjdmr94kf0rbwcl"; };
            });
          };
        };
      };
    };
  };
}
