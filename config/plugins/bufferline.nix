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
    (mkKeymap "n" "L" "<cmd>BufferLineCycleNext<CR>" "Cycle to next buffer tab")
    (mkKeymap "n" "H" "<cmd>BufferLineCyclePrev<CR>" "Cycle to previous buffer tab")
    (mkKeymap "" "<leader>x" "<cmd>lua Snacks.bufdelete.delete()<CR>" "Close the current buffer")
  ];
}
