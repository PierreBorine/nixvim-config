{pkgs, ...}: {
  plugins = {
    neoscroll = {
      enable = true;
      lazyLoad.settings.event = "BufRead";
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
    tiny-glimmer = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        transparency_color = "#151718";
        overwrite = {
          yank.enabled = true;
          paste.enable = true;
          undo.enabled = true;
          redo.enabled = true;
        };
      };
    };
    illuminate = {
      enable = true;
      # No Lazyloading, stop trying
      # https://github.com/RRethy/vim-illuminate/issues/112
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
      lazyLoad.settings.event = "DeferredUIEnter";
      settings.notification = {
        window = {
          # Transparent background fix
          winblend = 0;
        };
      };
    };
    tiny-inline-diagnostic = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvzone-volt
    nvzone-menu
  ];
}
