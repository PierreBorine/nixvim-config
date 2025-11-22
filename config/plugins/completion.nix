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
            # https://github.com/xzbdmw/colorful-menu.nvim/?tab=readme-ov-file#use-it-in-blinkcmp
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
          keyword.range = "prefix"; # can also be `full`
        };
      };
    };

    luasnip = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
      settings = {
        history = true;
        # enable_autosnippets = true; # big performance penalty
      };
    };
    friendly-snippets.enable = true;
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
    -- https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1429989436
    vim.api.nvim_create_autocmd('ModeChanged', {
      pattern = '*',
      callback = function()
        if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
            and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require('luasnip').session.jump_active
        then
          require('luasnip').unlink_current()
        end
      end
    })
  '';
}
