{ config, lib, pkgs, ...}:

{
  options = {
    virtualisation.enable = lib.mkEnableOption "enable virtualisation";
  };

  config = lib.mkIf config.virtualisation.enable {
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
  };
}
