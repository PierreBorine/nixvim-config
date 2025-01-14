{pkgs, ...}: {
  imports = [
    ./treesitter.nix
    ./completion.nix
    ./statusline.nix
    ./bufferline.nix
    ./nvim-tree.nix
    ./comments.nix
    ./base46.nix
    ./tools.nix
    ./lsp.nix
    ./fun.nix
    ./ui.nix
  ];

  plugins = {
    lz-n.enable = true; # Enables lazy loading

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
    telescope.enable = true;
    guess-indent.enable = true;
    conform-nvim.enable = true;
    nix.enable = true;
    markdown-preview.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvzone-volt
    nvzone-menu
    nvzone-minty
  ];
}
