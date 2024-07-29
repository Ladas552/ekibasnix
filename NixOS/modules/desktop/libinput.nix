{ config, lib, pkgs, ...}:


{
  options = {
    otd.enable = lib.mkEnableOption "enable otd";
  };

  config = lib.mkIf config.otd.enable {
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
