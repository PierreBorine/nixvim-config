{pkgs, ...}: {
  plugins.lspconfig.enable = true;
  lsp = {
    inlayHints.enable = true;
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
      qmlls = {
        enable = true;
        settings.cmd = ["qmlls" "-E"];
      };
      rust_analyzer.enable = true;
      ruff.enable = true;
    };
  };
  extraPackages = with pkgs; [
    cargo # rust_analyzer
  ];
}
