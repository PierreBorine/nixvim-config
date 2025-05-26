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
  ];

  plugins = {
    lz-n.enable = true; # Enables lazy loading

    tmux-navigator.enable = true;
    live-server = {
      enable = true;
      lazyLoad.settings.cmd = [
        "LiveServerStart"
        "LiveServerStop"
      ];
    };
    which-key = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    nix.enable = true;
    nix-develop = {
      enable = true;
      lazyLoad.settings.cmd = [
        "NixDevelop"
        "NixShell"
        "RiffShell"
      ];
    };
    markdown-preview.enable = true;
  };
}
