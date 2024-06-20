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
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      mode = "n";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fr";
      mode = "n";
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fs";
      mode = "n";
    }
    {
      action = "<cmd>Telescope grep_string<CR>";
      key = "<leader>fc";
      mode = "n";
    }
    ];
  };
}
