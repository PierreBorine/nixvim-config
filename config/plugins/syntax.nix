{
  config,
  mkKey,
  pkgs,
  lib,
  ...
}: let
  inherit (config.lib) isLang;
in {
  userCommands = {
    Trim = {
      command = "lua MiniTrailspace.trim()";
      desc = "Trim all trailing whitespace";
    };
  };

  plugins = {
    # Identation & whitespaces
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
          nix = lib.optional (isLang "Nix") "alejandra";
          rust = lib.optional (isLang "Rust") "rustfmt";
          python = lib.optionals (isLang "Python") [
            "ruff_fix"
            "ruff_format"
            "ruff_organize_imports"
          ];
          markdown = lib.optional (isLang "Markdown") "markdownlint-cli2";
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
        rust = lib.optional (isLang "Rust") "clippy";
        nix = lib.optionals (isLang "Nix") ["nix" "deadnix" "statix"];
        # haskell = ["hlint"];
        c = lib.optional (isLang "C") "clangtidy";
        cpp = lib.optional (isLang "C") "clangtidy";
        html = lib.optional (isLang "Web") "htmlhint";
        css = lib.optional (isLang "Web") "eslint_d";
        javascript = lib.optional (isLang "Web") "eslint_d";
        javascriptreact = lib.optional (isLang "Web") "eslint_d";
        typescript = lib.optional (isLang "Web") "eslint_d";
        typescriptreact = lib.optional (isLang "Web") "eslint_d";
        python = lib.optional (isLang "Python") "ruff";
        markdown = lib.optional (isLang "Markdown") "markdownlint-cli2";
      };

      linters = {
      };
      # FIX: cannot use `markdownlint-cli2` in `config.plugins.lint.linters`
      luaConfig.post =
        lib.optionalString (isLang "Markdown")
        # lua
        ''
          __lint.linters["markdownlint-cli2"].cmd = "${lib.getExe pkgs.markdownlint-cli2}"
          __lint.linters["markdownlint-cli2"].args = {"--disable", "MD033", "--", "-"}
        '';
    };

    # Treesitter
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

  extraPackages = with pkgs;
    [jq]
    ++ lib.optionals (isLang "Web") [eslint_d htmlhint]
    ++ lib.optionals (isLang "Nix") [alejandra deadnix statix]
    ++ lib.optional (isLang "Python") ruff # python linter & formatter
    ++ lib.optional (isLang "C") clang-tools
    ++ lib.optional (isLang "Markdown") markdownlint-cli2
    ++ lib.optionals (isLang "Rust") [clippy rustfmt];

  keymaps = [
    (mkKey.mkKeymap "" "gf" {__raw = "function()require('conform').format({async=true})end";} "Format buffer")
  ];
}
