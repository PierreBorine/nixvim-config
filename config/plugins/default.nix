{
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
  ];

  plugins = {
    lz-n.enable = true; # Enables lazy loading
    # "DeferredUIEnter" == "VeryLazy"

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

    # Comments
    ts-context-commentstring = {
      enable = true;
      extraOptions.enable_autocmd = false;
    };
    comment = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings.pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
    };
    todo-comments = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings.sign_priority = 6; # don't override git line status
    };
  };
}
