{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.lib.isLang "Nix") {
    lsp.servers.nixd = {
      enable = true;
      config = {
        nixpkgs.expr = "import <nixpkgs> { }";
        options.nixos = lib.mkIf (config.settings.flake != null) {
          expr = "(builtins.getFlake \"${toString config.settings.flake}\").nixosConfigurations.nixos.options";
        };
      };
    };

    plugins = {
      conform-nvim.settings = {
        formatters_by_ft.nix = ["alejandra"];
      };
      lint.lintersByFt.nix = ["nix" "deadnix" "statix"];

      nix.enable = true;
      nix-develop.enable = true;
      smartcolumn.settings.disabled_filetypes = ["nix"];
    };

    files = {
      "ftplugin/nix.lua" = {
        opts = {
          expandtab = true;
          shiftwidth = 2;
          tabstop = 2;
          softtabstop = 2;
        };
      };
    };

    extraPackages = [
      pkgs.alejandra
      pkgs.deadnix
      pkgs.statix
    ];
  };
}
