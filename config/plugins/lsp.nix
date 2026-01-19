{config, ...}: let
  inherit (config.lib) isLang;
in {
  plugins.lspconfig.enable = true;
  lsp = {
    inlayHints.enable = true;
    # https://langserver.org/
    servers = {
      bashls.enable = true;
      csharp_ls.enable = isLang "CS"; # C#
      ts_ls.enable = isLang "Web"; # Javascript / Typescript
      # Haskell
      # hls = {
      #   enable = true;
      #   installGhc = true;
      # };
      html.enable = isLang "Web";
      cssls.enable = isLang "Web";
      qmlls = {
        enable = isLang "QML";
        config.cmd = ["qmlls" "-E"];
      };
    };
  };
}
