{
  config,
  pkgs,
  lib,
  ...
}: {
  plugins.lspconfig.enable = true;
  lsp = {
    inlayHints.enable = true;
    # https://langserver.org/
    servers = {
      nixd = {
        enable = true;
        config = {
          nixpkgs.expr = "import <nixpkgs> { }";
          options.nixos = lib.mkIf (config.settings.flake != null) {
            expr = "(builtins.getFlake \"${toString config.settings.flake}\").nixosConfigurations.nixos.options";
          };
        };
      };
      bashls.enable = true;
      ccls = {
        enable = true; # C / C++
        # https://github.com/NixOS/nixpkgs/issues/449588
        package = pkgs.ccls.overrideAttrs {
          src = pkgs.fetchFromGitHub {
            owner = "MaskRay";
            repo = "ccls";
            rev = "5660367c771345b68c4ead4a4db2d4786985bf78";
            hash = "sha256-R+5pL0orUdHtquqvJa4esNmc6ETbX8WK5oJlBCSG+uI=";
          };
        };
      };
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
        config.cmd = ["qmlls" "-E"];
      };
      rust_analyzer.enable = true;
      # Python
      ruff.enable = true;
    };
  };
  extraPackages = with pkgs; [
    cargo # rust_analyzer
  ];
}
