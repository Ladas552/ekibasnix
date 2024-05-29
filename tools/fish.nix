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
      clean = "nh clean all";
      yy = "sudo nixos-rebuild switch --upgrade";
      yyh = "nh home switch -u ~/.config/home-manager/";
      en = "sudoedit /etc/nixos/";
      eh = "home-manager edit";
      v = "nvim";
      dl-video = "yt-dlp --embed-thumbnail -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4 --output '%(title)s.%(ext)s'";
      dl-clips = "yt-dlp --embed-thumbnail -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4 --ignore-errors --output '/home/ladas552/Videos/clips/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' --yes-playlist";
      dl-vocaloid = "yt-dlp --add-metadata --parse-metadata 'playlist_title:%(album)s' --embed-thumbnail --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --output '/home/ladas552/Music/vocaloid/%(playlist_uploader)s/%(playlist)s/%(title)s.%(ext)s' --yes-playlist";
    };
    shellAliases = {
      cat = ''${pkgs.bat}/bin/bat'';
      wiki = ''${pkgs.wiki-tui}/bin/wiki-tui'';
      df = ''${pkgs.duf}/bin/duf'';
      copypaste = ''${pkgs.wgetpaste}/bin/wgetpaste'';
      cmatrix = ''${pkgs.unimatrix}/bin/unimatrix -f -s 95'';
      mc = "${pkgs.ranger}/bin/ranger";
      mcm = "${pkgs.ranger}/bin/ranger ~/Music/";
      mcc = "${pkgs.ranger}/bin/ranger ~/.config/";
      mcp = "${pkgs.ranger}/bin/ranger ~/Pictures/";
    };
  };
}
