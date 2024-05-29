{ config, pkgs, inputs, ... }:

{
# Home Manager needs a bit of information about you and the paths it should
# manage.

  nixpkgs = {
    overlays =  [
      inputs.neorg-overlay.overlays.default
    ];
  };

  imports = [
 #   inputs.nix-colors.homeManagerModules.default
      inputs.nixvim.homeManagerModules.nixvim
      inputs.stylix.homeManagerModules.stylix
      ./desktop/graphics.nix
      ./desktop/bspwm.nix
      ./tools/apps.nix
  ];
# Me
  home.username = "ladas552";
  home.homeDirectory = "/home/ladas552";
# Don't change
  home.stateVersion = "23.11"; # Please read the comment before changing.
# Standalone Packages for user
    home.packages = with pkgs; [
    hello
      cowsay
      vesktop
      keepassxc
      libqalculate
      manix
      heroic
      prismlauncher
      floorp
      xclicker
      lshw
      niri
      libreoffice-fresh
      pavucontrol
      rofi
      telegram-desktop
      xarchiver
      python3
      hunspell
      hunspellDicts.en-us-large
      hunspellDicts.ru-ru
      numlockx
      pamixer
      texlive.combined.scheme-small
      winePackages.stagingFull
      winePackages.fonts
      winetricks
      bottles
      xclip
      peek
      qbittorrent
      ];

#  home.file = {
#
# # You can also set the file content immediately.
#".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
#
#  };
# Environment and Dependencies
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "text/plain" = ["neovim.desktop"];
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
        "image/*" = ["imv.desktop"];
        "video/*" = ["mpv.desktop"];
      };
      defaultApplications = {
        "text/plain" = [""];
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
        "image/*" = ["imv.desktop"];
        "video/*" = ["mpv.desktop"];
      };
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
# Environmental Variables
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
    TERMINAL = "kitty";
    TERM = "kitty";
    BROWSER = "floorp"; 
#XDG_BIN_HOME = "$HOME/.local/bin";
#PATH = "$HOME/.local/bin";
  };
# If you wanna set colorscheme from the list in https://github.com/tinted-theming/base16-schemes
# colorScheme = inputs.nix-colors.colorSchemes.dracula;
#ColorScheme LadasAzul
#  colorScheme = {
#    slug = "lazul";
#    name = "LadasAzul";
#    author = "Ladas552";
#    palette = {
#      base00 = "#181b28"; # background
#        base01 = "#f8f8f2"; # foreground or text 
#        base02 = "#ff5555"; # red
#        base03 = "#ff5454"; # bright red
#        base04 = "#50fa7b"; # green
#        base05 = "#50fa7b"; # bright green
#        base06 = "#f0fa8b"; # yellow
#        base07 = "#f0fa8b"; # bright yellow
#        base08 = "#bd92f8"; # blue
#        base09 = "#bd92f8"; # bright blue
#        base0A = "#ff78c5"; # purple
#        base0B = "#ff78c5"; # bright purple
#        base0C = "#8ae9fc"; # cyan
#        base0D = "#8ae9fc"; # bright cyan
#        base0E = "#bbbbbb"; # white
#        base10 = "#ffffff"; # bright white
#        base11 = "#000000"; # black
#        base12 = "#545454"; # bright black
#        base13 = "#1e1f28"; # selection foreground
#        base14 = "#44475a"; # selection background
#        base15 = "#da00e9"; # pink highlight
#        base16 = "#0087bd"; # url
##   base17 = "#59325C"; # 
#    };
#  };
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
