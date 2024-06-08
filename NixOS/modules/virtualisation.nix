{ config, lib, pkgs, ...}:
{
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
}
