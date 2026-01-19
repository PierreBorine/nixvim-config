{
  mkKey,
  pkgs,
  ...
}: {
  lsp = {
    inlayHints.enable = true;
    # https://langserver.org/
    servers = {
      bashls.enable = true;
      # Haskell
      # hls = {
      #   enable = true;
      #   installGhc = true;
      # };
    };
  };

  plugins = {
    lspconfig.enable = true;

    indent-o-matic = {
      enable = true;
      lazyLoad.settings.event = [
        "BufReadPost"
        "BufWritePost"
        "BufNewFile"
      ];
    };
    mini-trailspace = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };

    conform-nvim = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
        cmd = "ConformInfo";
        keys = ["gf"];
      };
      settings = {
        # https://github.com/stevearc/conform.nvim#formatters
        formatters_by_ft = {
          json = ["jq"];
        };
      };
    };

    lint = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      luaConfig.post =
        # lua
        ''
          vim.api.nvim_create_autocmd({ "BufEnter" }, {
            callback = function()
              __lint.try_lint()
            end,
          })
        '';
      # https://github.com/mfussenegger/nvim-lint/#available-linters
      # https://github.com/caramelomartins/awesome-linters
      lintersByFt = {
        # haskell = ["hlint"];
      };
    };

    treesitter = {
      enable = true;
      # Do **not** lazy-load
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        asm
        lua
        bash
        c
        cpp
        make
        c-sharp
        fish
        javascript
        html
        css
        scss
        typescript
        tsx
        nix
        regex
        rust
        glsl
        qmljs
        qmldir
        python

        markdown
        markdown-inline
        latex

        ini
        json
        yaml
      ];
      settings = {
        auto_install = false;
        highlight = {
          enable = true;
          useLanguagetree = true;
        };

        indent.enable = true;
      };
    };
  };

  userCommands = {
    Trim = {
      command = "lua MiniTrailspace.trim()";
      desc = "Trim all trailing whitespace";
    };
  };

  extraPackages = [pkgs.jq];

  keymaps = [
    (mkKey.mkKeymap "" "gf" {__raw = "function()require('conform').format({async=true})end";} "Format buffer")
  ];
}
