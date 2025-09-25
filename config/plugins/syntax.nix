{pkgs, ...}: {
  plugins = {
    # Identation & whitespaces
    sleuth.enable = true;
    mini-trailspace.enable = true;

    # Formatting
    conform-nvim = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
        cmd = "ConformInfo";
        keys = ["gf"];
      };
      # https://github.com/stevearc/conform.nvim#formatters
      settings.formatters_by_ft = {
        json = ["jq"];
        nix = ["alejandra"];
        rust = ["rustfmt"];
        markdown = ["markdownfmt"];
        python = [
          "ruff_fix"
          "ruff_format"
          "ruff_organize_imports"
        ];
      };
    };

    # Linting
    lint = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
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
        python = ["ruff"];
      };
    };

    # Treesitter
    treesitter = {
      enable = true;
      nixGrammars = true;
      lazyLoad.settings.event = "BufEnter";
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
    ruff # python linter & formatter
    jq

    clippy # Rust linting
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
