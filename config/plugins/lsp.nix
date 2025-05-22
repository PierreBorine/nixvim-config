{
  plugins.lspconfig.enable = true;
  lsp = {
    inlayHints = true;
    # https://langserver.org/
    servers = {
      nixd = {
        enable = true;
        settings.nixpkgs.expr = "import <nixpkgs> { }";
      };
      bashls.enable = true;
      ccls.enable = true; # C / C++
      csharp_ls.enable = true; # C#
      ts_ls.enable = true; # Javascript / Typescript
      # Haskell
      # hls = {
      #   enable = true;
      #   installGhc = true;
      # };
      html.enable = true;
      cssls.enable = true;
      qmlls.enable = true;
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
      };
    };
  };
}
