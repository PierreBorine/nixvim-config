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
        enable = config.lib.isLang "Nix";
        config = {
          nixpkgs.expr = "import <nixpkgs> { }";
          options.nixos = lib.mkIf (config.settings.flake != null) {
            expr = "(builtins.getFlake \"${toString config.settings.flake}\").nixosConfigurations.nixos.options";
          };
        };
      };
      bashls.enable = true;
      clangd.enable = config.lib.isLang "C"; # C / C++
      csharp_ls.enable = config.lib.isLang "CS"; # C#
      ts_ls.enable = config.lib.isLang "Web"; # Javascript / Typescript
      # Haskell
      # hls = {
      #   enable = true;
      #   installGhc = true;
      # };
      html.enable = config.lib.isLang "Web";
      cssls.enable = config.lib.isLang "Web";
      qmlls = {
        enable = config.lib.isLang "QML";
        config.cmd = ["qmlls" "-E"];
      };
      rust_analyzer.enable = config.lib.isLang "Rust";
      # Python
      ruff.enable = config.lib.isLang "Python";
      basedpyright.enable = config.lib.isLang "Python";
    };
  };
  extraPackages =
    lib.optional (config.lib.isLang "Rust") pkgs.cargo; # rust_analyzer
}
