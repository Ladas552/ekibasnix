{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
    pkgs.vimPlugins."nvim-web-devicons"
    pkgs.vimPlugins."gitsigns-nvim"
    pkgs.vimPlugins."lspkind-nvim"
    pkgs.vimPlugins."overseer-nvim"
    ];
    plugins = {
#  neorg = {
#    enable = true;
#  };
#LSP
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          lua-ls.enable = true;
          nil_ls.enable = true;
          typst-lsp.enable = true;
        };
      };

      luasnip.enable = true;
#UI
      which-key = {
        enable = true;
      };

      arrow = {
        enable = true;
        settings = {
          show_icons = true;
          full_path_list = [
            "update_stuff"
          ];
          save_path = ''
            function()
            return vim.fn.stdpath("cache") .. "/arrow"
            end
            '';
          global_bookmarks = true;
          always_show_path = true;
          separate_by_branch = true;
          buffer_leader_key = "m";
        };
      };

      barbar = {
        enable = true;
        settings = {
          animation = false;
          auto_hide = 1;
        };
      };

      ccc = {
        enable = true;
        settings = {
          highlighter = {
            auto_enable = true;
          };
        };
      };

      telescope = {
        enable = true;
        settings.defaults = {
          path_display = "truncate "; 
        };
      };

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
#cmp
      cmp = {
        enable = true;
        settings = {
          completion.completeopt = "menu,menuone,preview,noselect";
          snippet.expand = ''
            function(args)
            require("luasnip").lsp_expand(args.body)
            end,
            '';
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
          formatting = {
            format = ''
              require("lspkind").cmp_format({
                  maxwidth = 50,
                  ellipsis_char = "...",
                  mode = "symbol",
                  symbol_map = { Copilot = "" },
                  }),
            '';
          };
        };
      };

      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;
      copilot-cmp.enable = true;
#Workflow
      wtf = {
        enable = true;
        context = true;
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


      neogit = {
        enable = true;
      };

      auto-save = {
        enable = true;
      };

    };
  };
}

