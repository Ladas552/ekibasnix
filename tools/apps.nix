{ config, pkgs, inputs, ... }:

{
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
