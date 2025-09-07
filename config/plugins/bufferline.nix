{
  plugins = {
    snacks.settings.bufdelete.enabled = true;
    bufferline = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings.options = {
        style_preset.__raw = "require('bufferline').style_preset.no_italic";
        close_command.__raw = "function(n) Snacks.bufdelete(n) end";
        right_mouse_command.__raw = "function(n) Snacks.bufdelete(n) end";
        diagnostics = false;
        always_show_bufferline = false;
        indicator.style = "none";
        numbers = "none";
        buffer_close_icon = "󰅖 ";
        close_icon = " ";
        offsets = [
          {
            filetype = "NvimTree";
            text = "";
            highlight = "NvimTreeNormal";
            padding = 1;
          }
        ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options.desc = "Cycle to next buffer tab";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<S-tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "Cycle to previous buffer";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-tab>";
      action = "<cmd>BufferLineMoveNext<CR>";
      options.desc = "Move current buffer forward";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-S-tab>";
      action = "<cmd>BufferLineMovePrev<CR>";
      options.desc = "Move current buffer backward";
      options.silent = true;
    }
    {
      key = "<leader>x";
      action = "<cmd>lua Snacks.bufdelete.delete()<cr>";
      options.desc = "Close the current buffer";
      options.silent = true;
    }
  ];
}
