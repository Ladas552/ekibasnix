{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/modules.nix
    ];

#modules
otd.enable = true;
xfce.enable = true;
fonts.enable = true;
games.enable = true;
lightdm.enable = true;
openssh.enable = true;
zerotier.enable = true;
bluetooth.enable = true;
printers.enable = true;
virtualisation.enable = true;

# Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      timeoutStyle = "hidden";
      gfxmodeEfi = "1920x1080";
      gfxmodeBios = "1920x1080";
    };
    efi.efiSysMountPoint = "/boot";
    efi.canTouchEfiVariables = true;
  };
  networking.hostName = "NixToks"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
    networking.networkmanager.enable = true;

# Set your time zone.
  time.timeZone = "Asia/Almaty";

# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

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
    ];
  };
# Configure keymap in X11
    services.xserver = {
      xkb.layout = "us,kz";
      xkb.variant = "";
      xkb.options = "grp:caps_toggle";
      xkb.model = "pc105";
    };
# Experiment stuff
    nix.settings = {
      substituters = [
        "https://ezkea.cachix.org"
      ];
      trusted-public-keys = [
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];
      extra-substituters = [ 
        "https://yazi.cachix.org"
        "https://cache.garnix.io"
        "https://niri.cachix.org"    
      ];
      extra-trusted-public-keys = [
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
          "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      ];
    };

# Nvidia
# Enable OpenGL
    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
    };
#
# Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.
      hardware.nvidia = {
        modesetting.enable = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        prime = {
          sync.enable = true;
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };


# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.ladas552 = {
      isNormalUser = true;
      description = "Ladas552";
      extraGroups = [ "networkmanager" "wheel" "libvirtd"];
#packages = with pkgs; [
# firefox
#  thunderbird
#];
    };

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;


# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [
      22
      22067
 #     23
    ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
    networking.firewall.enable = true;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11"; # Did you read the comment?

  }
