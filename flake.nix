{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    lualine-so-fancy = {
      url = "github:meuter/lualine-so-fancy.nvim";
      flake = false;
    };

    toggler = {
      url = "github:nguyenvukhang/nvim-toggler";
      flake = false;
    };

    c-formatter-42 = {
      url = "github:Diogo-ss/42-C-Formatter.nvim";
      flake = false;
    };

    header-42-nvim = {
      url = "github:Diogo-ss/42-header.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    nixvim,
    ...
  }: let
    mkNixvim = {system, ...} @ settings: let
      pkgs = import nixpkgs {inherit system;};
      pkgs' = pkgs.extend (_: prev: import ./pkgs prev inputs);
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        extraSpecialArgs = import ./lib;
        pkgs = pkgs';
        module =
          import ./config
          // {
            settings =
              removeAttrs settings ["inputs" "system" "config"]
              // {
                flake =
                  if builtins.hasAttr "inputs" settings
                  then settings.inputs.self
                  else null;
              };
          }
          // (
            if builtins.hasAttr "config" settings
            then settings.config
            else {}
          );
      };
    in {
      module = nixvimModule;
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        lib.mkNvim = attrs: (mkNixvim attrs).nvim;
      };

      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {
        system,
        pkgs,
        ...
      }: {
        packages = let
          nvim' = mkNixvim {
            inherit system;
            maximal = true;
          };
        in {
          default = nvim'.nvim;

          # Recipes
          format = pkgs.writeShellScriptBin "format" ''
            alejandra check -e pkgs/ && nixpkgs-fmt pkgs/
          '';
        };

        legacyPackages = import ./pkgs pkgs inputs;

        checks = let
          nvim' = mkNixvim {
            inherit system;
            maximal = true;
          };
        in {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nvim'.module;
        };
      };
    };
}
