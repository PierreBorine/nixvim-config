{
  config,
  mkKey,
  pkgs,
  lib,
  ...
}: {
  plugins = {
    # Identation & whitespaces
    indent-o-matic = {
      enable = true;
      lazyLoad = {
        enable = true;
        settings = {
          event = [
            "BufReadPost"
            "BufWritePost"
            "BufNewFile"
          ];
        };
      };
    };
    mini-trailspace.enable = true;

    # Formatting
    conform-nvim = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
        cmd = "ConformInfo";
        keys = ["gf"];
      };
      settings = {
        formatters = {
          ruff_format = {
            # https://github.com/stevearc/conform.nvim/blob/master/lua/conform/formatters/ruff_format.lua
            args = [
              "format"
              "--line-length"
              "79" # This is the good part
              "--force-exclude"
              "--stdin-filename"
              "$FILENAME"
              "-"
            ];
          };
        };
        # https://github.com/stevearc/conform.nvim#formatters
        formatters_by_ft = {
          json = ["jq"];
          nix = lib.optional (config.lib.isLang "Nix") "alejandra";
          rust = lib.optional (config.lib.isLang "Rust") "rustfmt";
          # markdown = ["markdownfmt"];
          python = lib.optionals (config.lib.isLang "Python") [
            "ruff_fix"
            "ruff_format"
            "ruff_organize_imports"
          ];
        };
      };
    };

    # Linting
    lint = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      # https://github.com/mfussenegger/nvim-lint/#available-linters
      # https://github.com/caramelomartins/awesome-linters
      lintersByFt = {
        rust = lib.optional (config.lib.isLang "Rust") "clippy";
        nix = lib.optionals (config.lib.isLang "Nix") ["nix" "deadnix"];
        # haskell = ["hlint"];
        c = lib.optional (config.lib.isLang "C") "clangtidy";
        cpp = lib.optional (config.lib.isLang "C") "clangtidy";
        markdownlint = ["markdownlint"];
        html = lib.optional (config.lib.isLang "Web") "htmlhint";
        css = lib.optional (config.lib.isLang "Web") "eslint_d";
        javascript = lib.optional (config.lib.isLang "Web") "eslint_d";
        javascriptreact = lib.optional (config.lib.isLang "Web") "eslint_d";
        typescript = lib.optional (config.lib.isLang "Web") "eslint_d";
        typescriptreact = lib.optional (config.lib.isLang "Web") "eslint_d";
        python = lib.optional (config.lib.isLang "Python") "ruff";
      };
    };

    # Treesitter
    treesitter = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
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

  extraPackages = with pkgs;
    [jq markdownlint-cli]
    ++ lib.optionals (config.lib.isLang "Web") [eslint_d htmlhint]
    ++ lib.optionals (config.lib.isLang "Nix") [alejandra deadnix]
    ++ lib.optional (config.lib.isLang "Python") ruff # python linter & formatter
    ++ lib.optional (config.lib.isLang "C") clang-tools
    ++ lib.optionals (config.lib.isLang "Rust") [clippy rustfmt];

  keymaps = [
    (mkKey.mkKeymap "" "gf" {__raw = "function()require('conform').format({async=true})end";} "Format buffer")
  ];
}
