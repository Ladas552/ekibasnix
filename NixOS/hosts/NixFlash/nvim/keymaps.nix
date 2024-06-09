{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
    {
      action = "<cmd>redo<CR>";
      key = "<S-u>";
      mode = "n";
    }
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>ef";
      mode = "n";
    }
    ];
  };
}
