{pkgs, ...}: {
  plugins = {
    neoscroll = {
      enable = true;
      settings.easing = "cubic";
    };
    gitsigns = {
      enable = true;
      settings.signs = {
        delete.text = "󰍵";
        changedelete.text = "󱕖";
      };
    };
    web-devicons.enable = true;

    snacks.settings.indent.enabled = true;
    snacks.settings.chunk.enabled = true;
    snacks.settings.scope = {
      enabled = true;
      edge = false;
    };

    snacks.settings.statuscolumn = {
      enabled = true;
      folds.open = true;
      folds.git_hl = true;
      right = ["git" "fold"];
    };
    snacks.settings.animate = {
      enabled = true; # library
      easing = "cubic";
    };
    snacks.settings.input.enabled = true;
    noice = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    highlight-undo.enable = true;
    illuminate = {
      enable = true;
      minCountToHighlight = 2;
      filetypesDenylist = [
        "dirvish"
        "fugitive"
        "NvimTree"
        "TelescopePrompt"
      ];
    };
    fidget = {
      enable = true;
      settings.notification = {
        window = {
          # Transparent background fix
          winblend = 0;
        };
      };
    };
    tiny-inline-diagnostic.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvzone-volt
    nvzone-menu
  ];
}
