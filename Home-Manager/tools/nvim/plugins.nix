{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
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
          typst-lsp.enable = true;
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
        folding = true;
        nixvimInjections = true;
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

      typst-vim = {
        enable = true;
        settings = {
          auto_close_toc = true;
          pdf_viewer = "zathura";
        };
      };

      auto-save = {
        enable = true;
      };

      telescope = {
        enable = true;
        settings.defaults = {
          path_display = "truncate "; 
        };
      };

      cmp = {
        enable = true;
        settings = {
          sources = {
            __raw = ''
              cmp.config.sources({
                  { name = "nvim_lsp" },
                  { name = "luasnip" }, -- snippets
                  { name = "buffer" }, -- text within current buffer
                  { name = "path" }, -- file system paths
                  { name = "neorg" },
                  { name = "vimtex" }, 
                  { name = "codeium" },
                  { name = "copilot" },
                  }),
            '';
          };
          mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                  ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                  ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
                  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                  ["<C-f>"] = cmp.mapping.scroll_docs(4),
                  ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                  ["<ESC>"] = cmp.mapping.abort(), -- close completion window
                  ["<CR>"] = cmp.mapping.confirm({ select = false }),
                  })
            '';
          };
        };
      };

      cmp-path.enable = true;
      
      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          shortcut_type = "number";
          config = {
          header = [
            ''                                                     ''          
            ''  |                 |               ___|  ___| ___ \ ''
            ''  |       _` |   _` |   _` |   __|  __ \  __ \    ) |''
            ''  |      (   |  (   |  (   | \__ \    ) |   ) |  __/ ''
            '' _____| \__,_| \__,_| \__,_| ____/ ____/ ____/ _____|''
            ''                                                     ''        
          ];
          center = [
            { action = "Telescope oldfiles";   desc = " Recent files"; icon = "󰥔 ";  key = "R";}
            { action = "Telescope find_files"; desc = " Find files";   icon = " ";  key = "F";}
            { action = "ene | startinsert";    desc = " New file";     icon = " ";  key = "N";}
            { action = "Neorg workspace life"; desc = " Neorg Life";   icon = "󰠮 ";  key = "E";}
            { action = "Neorg workspace work"; desc = " Neorg Work";   icon = " ";  key = "W";}
            { action = "Neorg journal today";  desc = " Neorg Journal";icon = "󰛓 ";  key = "J";}
            { action = "Lazy";                 desc = " Lazy";         icon = "󰒲 ";  key = "L";}
            { action = "qa";                   desc = " Quit";         icon = "󰩈 ";  key = "Q";}
          ];
          footer = ["Just Do Something Already!"];
          };
        };
      };

    };
  };
}

