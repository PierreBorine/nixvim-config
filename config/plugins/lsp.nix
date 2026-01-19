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
      # Haskell
      # hls = {
      #   enable = true;
      #   installGhc = true;
      # };
      qmlls = {
        enable = isLang "QML";
        config.cmd = ["qmlls" "-E"];
      };
    };
  };
}
