{config, ...}: {
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

    render-markdown = {
      enable = config.lib.isLang "Markdown";
      lazyLoad.settings = {
        ft = "markdown";
        after =
          # lua
          ''
            function()
              Snacks.toggle({
                name = "Render Markdown",
                get = require("render-markdown").get,
                set = require("render-markdown").set,
              }):map("<leader>um")
            end
          '';
      };
    };
    markdown-preview = {
      enable = config.lib.isLang "Markdown";
      lazyLoad.settings.ft = "markdown";
    };
  };
}
