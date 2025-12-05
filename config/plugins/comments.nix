{
  plugins = {
    ts-context-commentstring = {
      enable = true;
      # Lazyload does not work well
      settings = {
        enable_autocmd = false;
        languages.c = {
          __default = "// %s";
          __multiline = "/* %s */";
        };
      };
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

  keymaps = [
    {
      key = "<leader>ct";
      action.__raw = ''
        function()Snacks.picker.todo_comments()end
      '';
      options.desc = "Todo";
    }
    {
      key = "<leader>cT";
      action.__raw = ''
        function()Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "TEMP" } })end
      '';
      options.desc = "Todo/Fix/Fixme/Temp";
    }
  ];
}
