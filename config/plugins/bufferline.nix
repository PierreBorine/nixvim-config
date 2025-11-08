{mkKey, ...}: {
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

  keymaps = let
    inherit (mkKey) mkKeymap;
  in [
    (mkKeymap "n" "<tab>" "<cmd>BufferLineCycleNext<CR>" "Cycle to next buffer tab")
    (mkKeymap "n" "<S-tab>" "<cmd>BufferLineCyclePrev<CR>" "Cycle to previous buffer tab")
    (mkKeymap "n" "<C-tab>" "<cmd>BufferLineMoveNext<CR>" "Move current buffer forward")
    (mkKeymap "n" "<C-S-tab>" "<cmd>BufferLineMovePrev<CR>" "Move current buffer backward")
    (mkKeymap "" "<leader>x" "<cmd>lua Snacks.bufdelete.delete()<CR>" "Close the current buffer")
  ];
}
