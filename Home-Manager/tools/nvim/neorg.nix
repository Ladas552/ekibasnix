{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    extraPlugins = [pkgs.vimPlugins."neorg"];
    extraConfigLua = ''
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
        }
      }
    require("neorg").setup({
        load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
        config = {
        icon_preset = "diamond",
        },
        },
        ["core.summary"] = {},
        ["core.ui.calendar"] = {},
        -- ["external.conceal-wrap"] = {},
        ["core.latex.renderer"] = { 
        config = { 
        render_on_enter = true, }, },
        ["core.integrations.image"] = {},
        ["core.esupports.metagen"] = { config = { timezone = "implicit-local", type = "empty", undojoin_updates = "false"} },
        --["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
        ["core.keybinds"] = {
        config = {
        default_keybinds = true,
        neorg_leader = "<Leader><Leader>",
        },
        },
        ["core.journal"] = {
        config = {
        workspace = "journal",
        journal_folder = "/./"
        },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              general = "~/Documents/Norg/",
              life = "~/Documents/Norg/Life/",
              work = "~/Documents/Norg/Study/",
              journal = "~/Documents/Norg/Journal/",
            },
            default_workspace = "general",
          },
        },
        -- ["external.conceal-wrap"] = {},
        },
    })
    ''; 
  };
}

