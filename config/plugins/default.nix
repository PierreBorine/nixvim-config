{config, ...}: {
  imports = [
    ./completion.nix
    ./statusline.nix
    ./bufferline.nix
    ./nvim-tree.nix
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
    live-server = {
      enable = config.lib.isLang "Web";
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

    render-markdown = {
      enable = true;
      lazyLoad.settings.ft = "markdown";
    };
    markdown-preview.enable = true;

    # Comments
    ts-context-commentstring = {
      enable = true;
      settings.enable_autocmd = false;
    };
    comment = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings.pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
    };
    todo-comments = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        sign_priority = 6; # don't override git line status
        keywords = {
          TEMP = {
            icon = "󱑂 ";
            color = "warning";
            alt = ["TEMPORARY"];
          };
        };
      };
    };
  };
}
