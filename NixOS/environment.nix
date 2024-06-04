{ config, lib, pkgs, ...}:
{
#XFCE DE and LightDM
  services = {
   displayManager.defaultSession = "xfce+bspwm";
    xserver = {
      desktopManager.xfce = {
        enable = true;
        enableXfwm = false;
      };
      desktopManager.xterm.enable = false;
      displayManager.lightdm = {
        enable = true;
        greeters.slick.enable = true;
        greeters.slick.theme.name = "Zukitre-dark";
      };
      windowManager.bspwm.enable = true;
      displayManager.setupCommands = ''
        ${pkgs.numlockx}/bin/numlockx on
        '';
    };
  };
##eyecandy on boot, my boot is too fast tho
#  boot.plymouth = {
#    enable = true;
#    theme = "nixos-bgrt";
#    themePackages = [
#      pkgs.nixos-bgrt-plymouth
#    ];
#    extraConfig = "
#    [Daemon]
#    ShowDelay=5
#    [Unit]
#    Conflicts=plymouth-quit.service
#    After=plymouth-quit.service rc-local.service plymouth-start.service systemd-user-sessions.service
#    OnFailure=plymouth-quit.service
#      
#    [Service]
#    ExecStartPost=-${pkgs.coreutils}/bin/sleep 30
#    ExecStartPost=-${pkgs.plymouth}/bin/plymouth quit --retain-splash
#    ";
#  };
  environment = {
    systemPackages = with pkgs; [
# whatever I couldn't install in Home Manager
      python3
        nvtopPackages.full # they need to update cuda for unstable to use it in home manager
        home-manager
        cachix
        gcc
        gnumake
        open-vm-tools
        libvirt-glib
        steam-run
    ];
    xfce.excludePackages = with pkgs.xfce; [
      mousepad
        parole
        ristretto
        xfce4-appfinder
        xfce4-screenshooter
        xfce4-taskmanager
 #       xfce4-terminal 
    ];
  };
  fonts.packages = with pkgs; [
    noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
#nix helper not available in HomeM right now
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.dates = "2 d";
  };

# Virtualisation stuff. IDK most of it but it seems to work
  services.spice-vdagentd.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      package = pkgs.qemu_kvm;
    };
  };
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
# Disable X11 prompt for Git. Changes work only after Reboot for some reason
# Here is the issue: https://github.com/NixOS/nixpkgs/issues/24311
  programs.ssh.askPassword = "";

# Optimize nix experience by removing cache and store garbage
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
#  nix.gc = { # doesn't work with nh.clean enabled
#    automatic = true;
#    dates = "weekly";
#    options = "--delete-older-than 14d";
#  };

# antivirus? Idk sounds cool
  services.clamav = {
    scanner = {
      enable = true;
      interval = "Sat *-*-* 04:00:00";
    };
    updater = {
      enable = true;
      frequency = 1;
      interval = "daily";
    };
    daemon.enable = true;
  };
# SSH connections
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    banner = "You shell not pass!";
    startWhenNeeded = true;
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
  services.zerotierone.enable = true;
}
