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
        # https://github.com/stevearc/conform.nvim#formatters
        formatters_by_ft = {
          json = ["jq"];
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
        # haskell = ["hlint"];
        html = lib.optional (isLang "Web") "htmlhint";
        css = lib.optional (isLang "Web") "eslint_d";
        javascript = lib.optional (isLang "Web") "eslint_d";
        javascriptreact = lib.optional (isLang "Web") "eslint_d";
        typescript = lib.optional (isLang "Web") "eslint_d";
        typescriptreact = lib.optional (isLang "Web") "eslint_d";
      };
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
    ++ lib.optionals (isLang "Web") [eslint_d htmlhint];

  keymaps = [
    (mkKey.mkKeymap "" "gf" {__raw = "function()require('conform').format({async=true})end";} "Format buffer")
  ];
}
