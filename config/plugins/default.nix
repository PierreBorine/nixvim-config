{
  imports = [
    ./completion.nix
    ./statusline.nix
    ./bufferline.nix
    ./nvim-tree.nix
    ./comments.nix
    ./terminal.nix
    ./syntax.nix
    ./tools.nix
    ./fold.nix
    ./lsp.nix
    ./fun.nix
    ./ui.nix
    ./42.nix
  ];

  # "DeferredUIEnter" == "VeryLazy"
  plugins.lz-n.enable = true; # Enables lazy loading
}
