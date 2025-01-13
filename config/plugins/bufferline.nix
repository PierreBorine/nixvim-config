{
  plugins = {
    bufdelete.enable = true;
    bufferline = {
      enable = true;
      settings.options = {
        style_preset = "no_italic";
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
}
