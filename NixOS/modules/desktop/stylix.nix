{ config, lib, pkgs, inputs, ...}:


{
  options = {
    stylix.enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf config.stylix.enable {
    stylix = {
      image = ./wallpapers/Stars.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
      autoEnable = true;
      polarity = "dark";
      targets = {
        bspwm.enable = false;
        nixvim.enable = false;
        kitty.enable = false;
        fish.enable = false;
        xfce.enable = true;
      };
      fonts = {
        serif = config.stylix.fonts.monospace;
        sansSerif = config.stylix.fonts.monospace;
        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
        monospace = {
          package = pkgs.jetbrains-mono;
          name = "JetBrainsMono";
        };
        sizes = {
          terminal = 14;
          popups = 14;
        };
      }; 
    };
  };
}
