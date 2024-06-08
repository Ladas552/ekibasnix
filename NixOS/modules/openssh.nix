{ config, lib, pkgs, ...}:

{
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
}
