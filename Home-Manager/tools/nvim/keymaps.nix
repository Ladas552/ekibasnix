{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
#Normal Key binds
    {
      action = "<cmd>redo<CR>";
      key = "<S-u>";
      mode = "n";
    }
#Buffer Navigation
    {
      action = "<cmd>BufferPrevious<CR>";
      key = "<leader>,";
      mode = "n";
    }
    {
      action = "<cmd>BufferNext<CR>";
      key = "<leader>.";
      mode = "n";
    }
    {
      action = "<cmd>BufferClose<CR>";
      key = "<leader>x";
      mode = "n";
    }
#Plugins
#Neorg Workspaces
    {
      action = "<cmd>Neorg workspace life<CR>";
      key = "<leader>nl";
      mode = "n";
    }
    {
      action = "<cmd>Neorg workspace work<CR>";
      key = "<leader>nw";
      mode = "n";
    }
    {
      action = "<cmd>Neorg workspace journal<CR>";
      key = "<leader>nn";
      mode = "n";
    }
#Neorg Journal
    {
      action = "<cmd>Neorg journal today<CR>";
      key = "<leader>jt";
      mode = "n";
    }
    {
      action = "<cmd>Neorg journal yesterday<CR>";
      key = "<leader>jy";
      mode = "n";
    }
    {
      action = "<cmd>Neorg journal tomorrow<CR>";
      key = "<leader>jT";
      mode = "n";
    }
#Oil
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>ef";
      mode = "n";
    }
#Telescope
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
