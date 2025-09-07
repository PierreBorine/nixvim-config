{
  description = "A nixvim configuration";

  nixConfig = {
    extra-substituters = [ "https://pierreborine.cachix.org" ];
    extra-trusted-public-keys = [ "pierreborine.cachix.org-1:D6WNCFqd5FZkTMem+QF+q25/lU2KFf8C7zBvvzhZZAk=" ];
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

    tiny-glimmer = {
      url = "github:rachartier/tiny-glimmer.nvim";
      flake = false;
    };
  };

  outputs = {
    flake-parts,
    nixvim,
    ...
  } @ inputs:
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
        pkgs' = pkgs.extend(prev: final: import ./pkgs prev final inputs);
        nixvimLib = nixvim.lib;
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          pkgs = pkgs';
          module = import ./config;
          extraSpecialArgs = {inherit nixvimLib;};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.${system}.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          default = nvim;
        };
      };
    };
}
