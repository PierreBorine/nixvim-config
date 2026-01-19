{
  plugins.lspconfig.enable = true;
  lsp = {
    inlayHints.enable = true;
    # https://langserver.org/
    servers = {
      bashls.enable = true;
      # Haskell
      # hls = {
      #   enable = true;
      #   installGhc = true;
      # };
    };
  };
}
