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
      auto-save = {
        enable = true;
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
    };
  };
}

