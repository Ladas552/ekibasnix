{ config, pkgs, inputs, ... }:

{
  fastfetch = {
    enable = true;
    settings = {
      logo.source = "nixos_small";
      display = {
        size = {
          binaryPrefix = "si";
        };
        separator = "  ";
      };
      modules = [
        "de"
        "wm"
        "terminal"
        "shell"
        "editor"
        "cpu"
      ];
    };
  };
}
