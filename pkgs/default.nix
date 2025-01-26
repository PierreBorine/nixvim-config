prev: final: inputs: {
  extraPlugins = {
    live-server = prev.callPackage ./live-server-nvim.nix {inherit inputs;};
    lualine-so-fancy = prev.callPackage ./lualine-so-fancy-nvim.nix {inherit inputs;};
    sudoku = prev.callPackage ./sudoku-nvim.nix {inherit inputs;};
  };
}
