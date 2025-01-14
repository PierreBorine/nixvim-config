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
    live-server.enable = true;

    web-devicons.enable = true; # for nvim-tree and bufferline
    which-key.enable = true;
    telescope.enable = true;
    indent-blankline.enable = true;
    guess-indent.enable = true;
    colorizer.enable = true;
    conform-nvim.enable = true;
    nix.enable = true;
    markdown-preview.enable = true;
    yazi.enable = true;
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
