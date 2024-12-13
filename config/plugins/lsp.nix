{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      nixd = {
        enable = true;
        extraOptions.offset_encoding = "utf-8"; # WARN: fix in neovim 0.10.3
        settings = {
          nixpkgs.expr = "import <nixpkgs> { }";
          formatting.command = ["alejandra"];
        };
      };
      ts_ls.enable = true;
      html.enable = true;
      cssls.enable = true;
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
      };
    };

    keymaps.lspBuf = {
      gD = "references";
      gd = "definition";
      gi = "implementation";
      gt = "type_definition";
      gf = "format";
    };
  };
}
