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
    indent-blankline.enable = true;
    dressing.enable = true;
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
