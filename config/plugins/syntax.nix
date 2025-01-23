{pkgs, ...}: {
  plugins = {
    # Identation & whitespaces
    intellitab.enable = true;
    indent-o-matic.enable = true;
    trim = {
      enable = true;
      settings = {
        trim_on_write = false;
        highlight = true;
      };
    };

    # Formatting
    conform-nvim = {
      enable = true;
      lazyLoad.settings = {
        event = "BufWritePre";
        cmd = "ConformInfo";
        keys = ["gf"];
      };
      # https://github.com/stevearc/conform.nvim#formatters
      settings.formatters_by_ft = {
        nix = ["alejandra"];
        rust = ["rustfmt"];
        markdown = ["markdownfmt"];
      };
    };

    # Linting
    lint = {
      enable = true;
      lintersByFt = {
        rust = ["clippy"];
        nix = ["nix" "deadnix"];
        haskell = ["hlint"];
        c = ["clangtidy"];
        cpp = ["clangtidy"];
        gitcommit = ["gitlint"];
        markdownlint = ["markdownlint"];
        html = ["htmlhint"];
        css = ["eslint_d"];
        javascript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
        typescript = ["eslint_d"];
        typescriptreact = ["eslint_d"];
      };
    };

    # Treesitter
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          c
          cpp
          c-sharp
          fish
          javascript
          html
          css
          scss
          typescript
          markdown
          json
          nix
          regex
          rust
          glsl
        ];
        highlight = {
          enable = true;
          useLanguagetree = true;
        };

        indent.enable = true;
      };
    };
  };

  keymaps = [
    {
      key = "gf";
      action.__raw = ''
        function()
          require("conform").format({ async = true })
        end
      '';
      options.desc = "Format buffer";
    }
  ];
}
