{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    # https://langserver.org/
    servers = {
      nixd = {
        enable = true;
        extraOptions.offset_encoding = "utf-8"; # WARN: fix in neovim 0.10.3
        settings.nixpkgs.expr = "import <nixpkgs> { }";
      };
      bashls.enable = true;
      ccls.enable = true; # C / C++
      csharp_ls.enable = true; # C#
      ts_ls.enable = true; # Javascript / Typescript
      # Haskell
      hls = {
        enable = true;
        installGhc = true;
      };
      html.enable = true;
      cssls.enable = true;
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
      };
    };
  };
}
