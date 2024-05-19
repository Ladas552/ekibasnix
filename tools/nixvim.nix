{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-nightly;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato"; # "mocha"; darker
    };
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
    globals.mapleader = " ";
    options = {
#Numbers on side 
      nu = true;
      relativenumber = true;
#Indent
      tabstop = 2; # 2 spaces for tabs (prettier default)
        shiftwidth = 2; # 2 spaces for indent width
        expandtab = true; # expand tab to spaces
        autoindent = true; # copy indent from current line when starting new one
#Search
        ignorecase = true; # ignore case when searching
        smartcase = true; # if you include mixed case in your search, assumes you want case-sensitive
#Colors
        termguicolors = true;
      background = "dark"; # colorschemes that can be light or dark will be made dark
        signcolumn = "yes"; # show sign column so that text doesn't shift
#Backspace
        backspace = "indent,eol,start"; # allow backspace on indent, end of line or insert mode start position
#Split windowws
        splitright = true; # split vertical window to the right
        splitbelow = true; # split horizontal window to the bottom
#Undo
        undofile = true;
#Scroll
      scrolloff = 8;
#Update
      updatetime = 50;
#Spelling
      spelllang = "en_us,ru";
      spell = true;
#Soft Wrap
      linebreak = true;
      breakindent = true;
#Go to new directory
      autochdir = true;
    };
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
    plugins = {
#  neorg = {
#    enable = true;
#  };

      wtf = {
        enable = true;
        context = true;
      };

      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          lua-ls.enable = true;
          nil_ls.enable = true;
        };
      };

      oil = {
        enable = true;
        settings = {
          delete_to_trash = true;
          view_options = {
            show_hidden = true;
          };
        };
      };

      which-key = {
        enable = true;
      };

      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true;
        };
      };

      treesitter = {
        enable = true;
        indent = true;
        ensureInstalled = [
          "bash"
            "fish"
            "gitignore"
            "html"
            "latex"
            "lua"
            "make"
            "markdown"
            "markdown_inline"
            "kotlin"
            "nix"
            "python"
            "vim"
            "rust"
            "yaml"
            "zathurarc"
        ];
      };
      image = {
        enable = true;
      };
    };
  };
}