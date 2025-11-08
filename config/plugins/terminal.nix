{mkKey, ...}: {
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

  keymaps = let
    inherit (mkKey) mkKeymap;
  in [
    (mkKeymap "t" "<C-x>" "<C-\\><C-N>" "Escape terminal mode")
    (mkKeymap "" "<leader>h" "<cmd>ToggleTerm direction=horizontal<CR>" "Toggle the horizontal terminal")
    (mkKeymap "" "<leader>v" "<cmd>ToggleTerm direction=vertical<CR>" "Toggle the vertical terminal")
  ];
}
