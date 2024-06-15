{ config, pkgs, inputs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
    {name = "autopair"; src = autopair.src;}
    {name = "bass"; src = bass.src; }
    {name = "done"; src = done.src; }
    {name = "pisces"; src = pisces.src; }
    {name = "pure"; src = pure.src; }
    {name = "sponge"; src = sponge.src; }
    ];
    shellAbbrs = {
      v = "nvim";
      mc = "ranger";
      mcc = "ranger ~/.config/";
    };
    shellAliases = {
      cat = ''${pkgs.bat}/bin/bat'';
      wiki = ''${pkgs.wiki-tui}/bin/wiki-tui'';
      df = ''${pkgs.duf}/bin/duf'';
      copypaste = ''${pkgs.wgetpaste}/bin/wgetpaste'';
      cmatrix = ''${pkgs.unimatrix}/bin/unimatrix -f -s 95'';
    };
  };
}
