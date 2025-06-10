{pkgs, ...}: {
  plugins = {
    # Identation & whitespaces
    indent-o-matic.enable = true;
    mini = {
      enable = true;
      modules.trailspace = { };
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
      # https://github.com/mfussenegger/nvim-lint/#available-linters
      # https://github.com/caramelomartins/awesome-linters
      lintersByFt = {
        rust = ["clippy"];
        nix = ["nix" "deadnix"];
        # haskell = ["hlint"];
        c = ["cppcheck"]; # clangtidy/cpplint/cppcheck
        cpp = ["cppcheck"];
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
        auto_install = false;
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
          tsx
          markdown
          json
          nix
          regex
          rust
          glsl
          qmljs
          qmldir
        ];
        highlight = {
          enable = true;
          useLanguagetree = true;
        };

        indent.enable = true;
      };
    };
  };

  extraPackages = with pkgs; [
    alejandra
    rustfmt

    clippy
    cppcheck
    deadnix
    gitlint
    htmlhint
    eslint_d
  ];

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
