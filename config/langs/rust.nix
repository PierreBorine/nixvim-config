{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.lib.isLang "Rust") {
    lsp.servers.rust_analyzer.enable = true;

    plugins = {
      conform-nvim.settings = {
        formatters_by_ft = {
          rust = ["rustfmt"];
        };
      };
      lint.lintersByFt.rust = ["clippy"];
    };

    extraPackages = [
      pkgs.cargo # Lsp
      pkgs.clippy # Linter
      pkgs.rustfmt # Formatter
    ];
  };
}
