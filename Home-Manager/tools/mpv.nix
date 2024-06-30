{ config, pkgs, inputs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      ytdl-raw-options = "yes-playlist=";
      audio-file-auto= "fuzzy";
      audio-file-paths= "**";
      sub-file-paths= "**";
      sub-auto= "fuzzy";
      slang= "rus,eng";
      alang= "jpn,eng";
    };
    profiles = {
      "extension.webm" = {
        loop-file= "inf";
      };
    };
    bindings = {
      "[" = "add speed -0.25";
      "]" = "add speed 0.25";
      "C" = "cycle sub";
      "A" = "cycle audio";
      "V" = "cycle video";
      "<" = "add chapter -1";
      ">" = "add chapter 1";
      "K" = "add sub-scale +0.1";
      "J" = "add sub-scale -0.1";
    };
    scripts = with pkgs.mpvScripts; [
      sponsorblock-minimal
      reload
      quality-menu
      memo
      autoload
    ];
  };
}
