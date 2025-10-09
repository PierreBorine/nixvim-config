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

    mkNixvim = system: extra: let
      pkgs = import nixpkgs {inherit system;};
      pkgs' = pkgs.extend (prev: _: import ./pkgs prev inputs);
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        pkgs = pkgs';
        module = import ./config // extra;
      };
    in {
      module = nixvimModule;
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    };
  in {
    packages = forAllSystems ({pkgs, ...}: let
      nvim' = mkNixvim pkgs.system {};
    in {
      default = nvim'.nvim;
      format = pkgs.writeShellScriptBin "format" ''
        alejandra check -e pkgs/ && nixpkgs-fmt pkgs/
      '';
    });

    checks = forAllSystems ({system, ...}: let
      nvim' = mkNixvim system {};
    in {
      # Run `nix flake check .` to verify that your config is not broken
      default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nvim'.module;
    });

    lib = {
      mkNvim = {
        wakatime ? false,
        inputs ? {self = null;},
        system,
      }:
        (mkNixvim system {
          settings = {
            inherit wakatime;
            flake = inputs.self;
          };
        }).nvim;
    };
  };
}
