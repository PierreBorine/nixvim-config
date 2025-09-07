prev: inputs: {
  extraPlugins = {
    live-server = prev.callPackage ./live-server.nix {inherit inputs;};
    lualine-so-fancy = prev.callPackage ./lualine-so-fancy.nix {inherit inputs;};
    sudoku = prev.callPackage ./sudoku.nix {inherit inputs;};
    nvim-toggler = prev.callPackage ./toggler.nix {inherit inputs;};
  };
}
