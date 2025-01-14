{pkgs, ...}: {
  imports = [
    ./treesitter.nix
    ./completion.nix
    ./statusline.nix
    ./bufferline.nix
    ./nvim-tree.nix
    ./base46.nix
    ./lsp.nix
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
    web-devicons.enable = true; # for nvim-tree and bufferline
    which-key = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    telescope.enable = true;
    indent-blankline.enable = true;
    guess-indent.enable = true;
    colorizer = {
      enable = true;
      lazyLoad.settings.event = "BufReadPre";
    };
    conform-nvim.enable = true;
    nix.enable = true;
    markdown-preview.enable = true;
    yazi = {
      enable = true;
      lazyLoad.settings.cmd = "Yazi";
    };
    lazygit.enable = true;

    fugitive.enable = true;
    gitsigns = {
      enable = true;
      settings.signs = {
        delete.text = "󰍵";
        changedelete.text = "󱕖";
      };
    };

    comment.enable = true;
    comment-box.enable = true;
    todo-comments = {
      enable = true;
      settings.sign_priority = 6; # default overrides git line status
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    cellular-automaton-nvim
    nvzone-volt
    nvzone-menu
    nvzone-minty
  ];
}
