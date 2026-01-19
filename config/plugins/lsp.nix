{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (config.lib) isLang;
in {
  plugins.lspconfig.enable = true;
  lsp = {
    inlayHints.enable = true;
    # https://langserver.org/
    servers = {
      nixd = {
        enable = isLang "Nix";
        config = {
          nixpkgs.expr = "import <nixpkgs> { }";
          options.nixos = lib.mkIf (config.settings.flake != null) {
            expr = "(builtins.getFlake \"${toString config.settings.flake}\").nixosConfigurations.nixos.options";
          };
        };
      };
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
      rust_analyzer.enable = isLang "Rust";
    };
  };
  extraPackages =
    lib.optional (isLang "Rust") pkgs.cargo; # rust_analyzer
}
