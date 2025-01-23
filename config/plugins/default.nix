{pkgs, ...}: {
  imports = [
    ./completion.nix
    ./statusline.nix
    ./bufferline.nix
    ./nvim-tree.nix
    ./comments.nix
    ./terminal.nix
    ./base46.nix
    ./syntax.nix
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
    nix.enable = true;
    markdown-preview.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvzone-volt
    nvzone-menu
    nvzone-minty
  ];
}
