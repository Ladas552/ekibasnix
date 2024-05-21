{ config, pkgs, inputs, ... }:

{
  programs = {
    zathura = {
      enable = true;
      catppuccin.enable = true;
    };
    ncmpcpp = {
      enable = true;
    };
    btop = {
      enable = true;
      catppuccin.enable = true;
    };
    fd = {
      enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      catppuccin.enable = true;
    };
  };
}
