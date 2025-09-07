{
  plugins.toggleterm = {
    enable = true;
    lazyLoad = {
      settings = {
        cmd = "ToggleTerm";
        keys = [
          "<leader>v"
          "<leader>h"
        ];
      };
    };
    settings = {
      start_in_insert = false;
      shade_terminals = false;
      size.__raw = ''
        function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
          end
        end
      '';
      float_opts.border = "curved";
    };
  };

  keymaps = [
    {
      mode = "t";
      key = "<C-x>";
      action = "<C-\\><C-N>";
      options.desc = "Escape terminal mode";
      options.silent = true;
    }
    {
      key = "<leader>h";
      action = "<cmd>ToggleTerm direction=horizontal<CR>";
      options.desc = "Toggle the horizontal terminal";
      options.silent = true;
    }
    {
      key = "<leader>v";
      action = "<cmd>ToggleTerm direction=vertical<CR>";
      options.desc = "Toggle the vertical terminal";
      options.silent = true;
    }
  ];
}
