{pkgs, ...}: {
  plugins = {
    smear-cursor = {
      enable = true;
      settings = {
        stiffness = 0.5;
        trailing_stiffness = 0.49;
        never_draw_over_target = false;
      };
    };
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
    fidget.enable = true;
    tiny-inline-diagnostic.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvzone-volt
    nvzone-menu
  ];
}
