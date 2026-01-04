{mkKey, ...}: {
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

  plugins = {
    lz-n.enable = true; # Enables lazy loading
    # "DeferredUIEnter" == "VeryLazy"

    tmux-navigator.enable = true;
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

    render-markdown = {
      enable = true;
      lazyLoad.settings.ft = "markdown";
    };
    markdown-preview = {
      enable = true;
      lazyLoad.settings.ft = "markdown";
    };
  };

  keymaps = [
    (mkKey.mkKeymap "" "<leader>cm" "<cmd>FeMaco<CR>" "Edit a markdown code block.")
  ];
}
