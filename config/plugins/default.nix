{pkgs, ...}: {
  imports = [
    ./live-server.nix
    ./treesitter.nix
    ./completion.nix
    ./nvim-tree.nix
    ./lsp.nix
    ./nvchad.nix
  ];

  plugins = {
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
    transparent.enable = true;

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
  ];
}
