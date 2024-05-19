{pkgs, config, inputs, ...}:

{

  programs.kitty = {
    enable = true;
    settings = with config.colorScheme.colors; {
#kitty.conf
      enable_audio_bell = false;
      shell = ''fish'';
      url_style = ''single'';
      cursor_shape = ''block'';
      scrollbacl_lines = 2000;
      confirm_os_window_close = 0;
      font_size = 11;
#colors.conf
      background = ''#${base00}'';
      foreground = ''#${base01}'';
      selection_foreground = ''#${base13}'';
      selection_background = ''#${base14}'';
      color0 = ''#${base11}''; # Black
        color1 = ''#${base02}''; # Red
        color2 = ''#${base04}''; # Green
        color3 = ''#${base15}''; # highligh
        color4 = ''#${base08}''; # Blue
        color5 = ''#${base0A}''; # Magenta
        color6 = ''#${base0C}''; # Cyan
        color7 = ''#${base0E}''; # White
        color8 = ''#${base12}''; # br Black
        color9 = ''#${base03}''; # br Red
        color10 = ''#${base05}''; # br Green
        color11 = ''#${base07}''; # br Yellow
        color12 = ''#${base09}''; # br Blue
        color13 = ''#${base0B}''; # br Magenta
        color14 = ''#${base0D}''; # br Cyan
        color15 = ''#${base10}''; # br White
        url_color = ''#${base16}''; #url
        cursor = ''#f4dbd6'';
      cursor_text_color = ''#24273a'';
      active_border_color = ''#B7BDF8'';
      inactive_border_color = ''#6E738D'';
      bell_border_color = ''#EED49F'';
      active_tab_foreground = "#181926";
      active_tab_background = "#C6A0F6";
      inactive_tab_foreground = "#CAD3F5";
      inactive_tab_background = "#1E2030";
      tab_bar_background = "#181926";
    };
  };


}

