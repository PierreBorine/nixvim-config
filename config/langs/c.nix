{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.lib.isLang "C") {
    lsp.servers.clangd.enable = true;

    plugins = {
      # TODO: add formatter ?
      # conform-nvim.settings.formatters_by_ft = {};
      lint = {
        lintersByFt = {
          c = ["clangtidy"];
          cpp = ["clangtidy"];
        };
        linters.clangtidy = {
          cmd = lib.getExe' pkgs.clang-tools "clangtidy";
        };
      };
    };
  };
}
