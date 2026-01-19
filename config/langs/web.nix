{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.lib.isLang "Web") {
    lsp.servers = {
      ts_ls.enable = true;
      html.enable = true;
      cssls.enable = true;
    };

    plugins = {
      lint.lintersByFt = {
        html = ["htmlhint"];
        css = ["eslint_d"];
        javascript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
        typescript = ["eslint_d"];
        typescriptreact = ["eslint_d"];
      };
    };

    extraPackages = [
      pkgs.eslint_d
      pkgs.htmlhint
    ];
  };
}
