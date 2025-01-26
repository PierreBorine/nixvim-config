{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lua";}
          {name = "luasnip";}
          {name = "path";}
          {name = "treesitter";}
        ];

        completion.completeopt = "menu,menuone";

        snippet.expand = ''
          function(args)
            require("luasnip").lsp_expand(args.body)
          end
        '';

        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";

          "<CR>" = ''
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }
          '';

          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
        };

        window = let
          window = {
            border = "rounded";
            col_offset = 0;
            scrollbar = true;
            scrolloff = 0;
            side_padding = 1;
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
            zindex = 1001;
          };
        in {
          completion = window;
          documentation = window;
        };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-cmdline.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-treesitter.enable = true;
    cmp_luasnip.enable = true;

    luasnip = {
      enable = true;
      settings = {
        history = true;
        updateevents = "TextChanged,TextChangedI";
        enable_autosnippets = true; # big performance penalty
      };
    };
    friendly-snippets.enable = true;
    nvim-autopairs.enable = true;
  };
}
