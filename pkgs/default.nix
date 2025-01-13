pkgs: inputs: {
  live-server = pkgs.callPackage ./live-server-nvim.nix {};
  lualine-so-fancy = pkgs.callPackage ./lualine-so-fancy-nvim.nix {inherit inputs;};
}
