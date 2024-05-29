{ config, pkgs, inputs, ... }:

{
  imports = [
  ./fish.nix
  ./git.nix
  ./nixvim.nix
  ./ranger.nix
  ./term.nix
  ];
  programs = {
    zathura = {
      enable = true;
    };
    ncmpcpp = {
      enable = true;
    };
    btop = {
      enable = true;
    };
    fd = {
      enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    fastfetch = {
      enable = true;
    };
    mangohud = {
      enable = true;
    };
    yt-dlp = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
    imv = {
      enable = true;
    };
    mpv = {
      enable = true;
    };
    obs-studio = {
      enable = true;
    };
    jujutsu = {
      enable = true;
    };
  };
  services = {
    flameshot = {
      enable = true;
    };
    syncthing = {
      enable = true;
      tray = true;
    };
  };
}
