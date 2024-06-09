{ config, pkgs, inputs, ... }:

{
 home = { programs.git = {
    enable = true;
    userName = "Ladas552";
    userEmail = "l.tokshalov@gmail.com";
  };
  };
}
