{gconfig, pkgs, inputs, ... }:

{
# Home Manager needs a bit of information about you and the paths it should
# manage.

  nixpkgs = {
    overlays =  [
      inputs.neorg-overlay.overlays.default
    ];
  };

  imports = [
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
      floorp
      lshw
      niri
      libreoffice-fresh
      pavucontrol
      rofi
      telegram-desktop
      xarchiver
      python3
      nuspell
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
      candy-icons
      catppuccin-cursors
      ];
  nixpkgs.config.allowUnfree = true;
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
#    mime.enable = true;
#    mimeApps = {
#      enable = true;
#      associations.added = {
#        "text/plain" = ["neovim.desktop"];
#        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
#        "image/*" = ["imv.desktop"];
#        "video/*" = ["mpv.desktop"];
#      };
#      defaultApplications = {
#        "text/plain" = [""];
#        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
#        "image/*" = ["imv.desktop"];
#        "video/*" = ["mpv.desktop"];
#      };
#    };
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
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
#programs.home-manager.path = "$HOME/Nix-dots/Home-Manager";
}
