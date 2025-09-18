{
  description = "A nixvim configuration";

  nixConfig = {
    extra-substituters = ["https://pierreborine.cachix.org"];
    extra-trusted-public-keys = ["pierreborine.cachix.org-1:D6WNCFqd5FZkTMem+QF+q25/lU2KFf8C7zBvvzhZZAk="];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

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
  };

  outputs = {
    flake-parts,
    nixvim,
    ...
  } @ inputs: let
    mkNixvim = pkgs: extra: let
      pkgs' = pkgs.extend (prev: _: import ./pkgs prev inputs);
      nixvim' = nixvim.legacyPackages.${pkgs.system};
      nixvimModule = {
        pkgs = pkgs';
        module = import ./config // extra;
      };
    in {
      module = nixvimModule;
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nvim = mkNixvim pkgs {};
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nvim.module;
        };

        packages = {
          default = nvim.nvim;
          format = pkgs.writeShellScriptBin "format" ''
            alejandra check -e pkgs/ && nixpkgs-fmt pkgs/
          '';
        };
      };

      flake.lib = {
        mkNvim = {
          wakatime ? false,
          flake ? null,
          pkgs,
        }:
          (mkNixvim pkgs {
            settings = {
              inherit wakatime flake;
            };
          }).nvim;
      };
    };
}
