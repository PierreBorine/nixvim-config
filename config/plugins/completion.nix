{
  plugins = {
    blink-cmp = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      setupLspCapabilities = true;
      settings = {
        keymap.preset = "enter";
        signature = {
          enabled = true;
          window.border = "rounded";
        };
        completion = {
          menu = {
            border = "rounded";
            # https://github.com/xzbdmw/colorful-menu.nvim#use-it-in-blinkcmp
            draw = {
              columns = [
                ["kind_icon"]
                {
                  __unkeyed-1 = "label";
                  gap = 1;
                }
              ];
              components.label = {
                text.__raw = ''
                  function(ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                  end
                '';
                highlight.__raw = ''
                  function(ctx)
                    return require("colorful-menu").blink_components_highlight(ctx)
                  end
                '';
              };
            };
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 50;
            window.border = "rounded";
          };
          ghost_text.enabled = true;
          keyword.range = "prefix"; # or "full"
        };
        snippets.preset = "luasnip";
      };
    };

    luasnip = {
      enable = true;
      lazyLoad.settings.event = [
        "InsertEnter"
        "BufReadPre" # For neogen
      ];
      fromVscode = [{}];
      settings = {
        delete_check_events = "TextChanged";
      };
    };
    friendly-snippets.enable = true;
    neogen = {
      enable = true;
      lazyLoad.settings.event = "BufReadPre";
      keymaps.generate = "<leader>cd";
      settings.snippet_engine = "luasnip";
    };
    nvim-autopairs = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
      settings = {
        check_ts = true;
      };
    };
    ts-autotag = {
      enable = true;
      lazyLoad.settings.event = "BufReadPre";
    };
    colorful-menu.enable = true;
  };

  extraConfigLua = ''
    -- From:  https://github.com/saghen/blink.cmp/issues/2035#issuecomment-3125771318
    -- Fixes: https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1429989436
    vim.api.nvim_create_autocmd('ModeChanged', {
      desc = 'Unlink current snippet on leaving insert/selection mode.',
      group = vim.api.nvim_create_augroup('LuaSnipModeChanged', {}),
      pattern = '[si]*:[^si]*',
      callback = vim.schedule_wrap(function(event)
        local ls = require('luasnip')
        if vim.fn.mode():match('^[si]') then -- still in insert/select mode
          return
        end
        if ls.session.current_nodes[event.buf] and not ls.session.jump_active then
          ls.unlink_current()
        end
      end),
    })
  '';
}
