{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.lib.isLang "Python") {
    lsp.servers = {
      ruff.enable = true;
      basedpyright.enable = true;
    };

    plugins = {
      conform-nvim.settings = {
        formatters_by_ft = {
          python = [
            "ruff_fix"
            "ruff_format"
            "ruff_organize_imports"
          ];
        };
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
      };
      lint = {
        lintersByFt.python = ["ruff" "mypy"];
        linters.mypy.cmd = lib.getExe pkgs.mypy;
      };

      smartcolumn.settings.custom_colorcolumn = {
        python = ["79"];
      };
    };

    extraPackages = [pkgs.ruff];
  };
}
