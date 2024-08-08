{ config, lib, pkgs, ...}:


{
  options = {
    libinput.enable = lib.mkEnableOption "enable libinput";
  };

  config = lib.mkIf config.libinput.enable {
    services.xserver.libinput = {
      enable = true;
      mouse = {
        scrollMethod = "button";
        sctrollButton = "3";
      };
      touchpad = {
        tapping = true;
        naturalScrolling = true;
        scrollMethod = "edge";
        touchpad.disableWhileTypin = false;
        clickMethod = "clickfinger";
      };
    };
  };
}
