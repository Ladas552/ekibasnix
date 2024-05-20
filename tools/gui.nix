{ config, pkgs, inputs, ... }:

{
  programs = {
    zathura = {
      enable = true;
      catppuchhin.enable = true;
    };
  };
}
