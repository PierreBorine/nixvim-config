{pkgs, ...}: {
  plugins = {
    web-devicons.enable = true;

    # Inlay elements
    snacks.settings.indent.enabled = true;
    snacks.settings.chunk.enabled = true;
    snacks.settings.scope = {
      enabled = true;
      edge = false;
    };
    illuminate = {
      enable = true;
      # No Lazyloading, stop trying
      # https://github.com/RRethy/vim-illuminate/issues/112
      settings = {
        min_count_to_highlight = 2;
        filetypes_denylist = [
          "dirvish"
          "fugitive"
          "NvimTree"
          "TelescopePrompt"
        ];
      };
    };

    # Color column
    smartcolumn = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        disabled_filetypes = [
          "help"
          "text"
        ];
      };
    };
    virt-column = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };

    # Status column
    modicator = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings.integration.lualine.mode_section = "a";
    };
    snacks.settings.statuscolumn = {
      enabled = true;
      folds.open = true;
      folds.git_hl = true;
      right = ["git" "fold"];
    };
    gitsigns = {
      enable = true;
      lazyLoad.settings = {
        event = "BufRead";
        after =
          # lua
          ''
            function()
              local _gitsigns = require("gitsigns")
              local _config = require("gitsigns.config").config
              Snacks.toggle({
                name = "git inline blame line",
                get = function() return _config.current_line_blame end,
                set = function(state) _gitsigns.toggle_current_line_blame(state) end,
              }):map("<leader>ub")

              Snacks.toggle({
                name = "git inline diff",
                get = function() return _config.linehl and _config.word_diff end,
                set = function(state)
                  _gitsigns.toggle_linehl(state)
                  _gitsigns.toggle_word_diff(state)
                end,
              }):map("<leader>ui")
            end
          '';
      };
      settings.signs = {
        delete.text = "󰍵";
        changedelete.text = "󱕖";
      };
    };

    # Animations
    snacks.settings.animate = {
      enabled = true; # library
      easing = "cubic";
    };
    neoscroll = {
      enable = true;
      lazyLoad.settings.event = "BufRead";
      settings.easing = "cubic";
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

    # Text elements
    snacks.settings.picker = {
      enabled = true;
      layout.preset = "telescope";
    };
    snacks.settings.input.enabled = true;
    noice = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
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
    nvzone-minty
  ];

  keymaps = [
    {
      mode = ["n" "v"];
      key = "<RightMouse>";
      action.__raw = ''
        function()
          require('menu.utils').delete_old_menus()
          vim.cmd.exec '"normal! \\<RightMouse>"'

          -- clicked buf
          local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
          local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
          require("menu").open(options, { mouse = true })
        end
      '';
      options.desc = "Menu";
    }
  ];
}
