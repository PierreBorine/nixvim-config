{
  description = "A nixvim configuration";

  nixConfig = {
    extra-substituters = ["https://pierreborine.cachix.org"];
    extra-trusted-public-keys = ["pierreborine.cachix.org-1:D6WNCFqd5FZkTMem+QF+q25/lU2KFf8C7zBvvzhZZAk="];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

    live-server = {
      url = "github:barrett-ruth/live-server.nvim";
      flake = false;
    };

    lualine-so-fancy = {
      url = "github:meuter/lualine-so-fancy.nvim";
      flake = false;
    };

    sudoku = {
      url = "github:jim-fx/sudoku.nvim";
      flake = false;
    };

    toggler = {
      url = "github:nguyenvukhang/nvim-toggler";
      flake = false;
    };

    c-formatter-42 = {
      url = "github:cacharle/c_formatter_42.vim";
      flake = false;
    };

    header-42 = {
      url = "github:42Paris/42header";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    ...
  } @ inputs: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (system:
        f {
          inherit system;
          pkgs = import nixpkgs {inherit system;};
        });

    mkNixvim = {system, ...} @ settings: let
      pkgs = import nixpkgs {inherit system;};
      pkgs' = pkgs.extend (_: prev: import ./pkgs prev inputs);
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        pkgs = pkgs';
        module =
          import ./config
          // {
            settings =
              builtins.removeAttrs settings ["inputs" "system"]
              // {
                flake =
                  if builtins.hasAttr "inputs" settings
                  then settings.inputs.self
                  else null;
              };
          };
      };
    in {
      module = nixvimModule;
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    };
  in {
    packages = forAllSystems ({pkgs, ...}: let
      nvim' = mkNixvim {inherit (pkgs) system;};
    in {
      default = nvim'.nvim;
      bundle-der = nvim'.nvim.overrideAttrs {pname = "nixvim";};

      # Recipes
      bundle = pkgs.writeShellScriptBin "bundle" ''
        nix bundle .#bundle-der
      '';
      bundle-deb = pkgs.writeShellScriptBin "bundle" ''
        nix bundle --bundler github:NixOS/bundlers#toDEB .#bundle-der
      '';
      format = pkgs.writeShellScriptBin "format" ''
        alejandra check -e pkgs/ && nixpkgs-fmt pkgs/
      '';
    });

    legacyPackages = forAllSystems (
      {pkgs, ...}: import ./pkgs pkgs inputs
    );

    checks = forAllSystems ({system, ...}: let
      nvim' = mkNixvim {
        inherit system;
        maximal = true;
      };
    in {
      # Run `nix flake check .` to verify that your config is not broken
      default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nvim'.module;
    });

    lib.mkNvim = attrs: (mkNixvim attrs).nvim;
  };
}
