{pkgs, ...}: {
  extraPlugins = [ pkgs.vimPlugins.cellular-automaton-nvim ];

  plugins = {
    hardtime = {
      enable = false;
      settings = {
        max_count = 80;
      };
    };
    sudoku = {
      enable = true;
      settings.persist_games = false;
    };
    typr = {
      enable = true;
      settings = {
        kblayout = "azerty";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>mr"; # make rain
      action = "<cmd>CellularAutomaton make_it_rain<CR>";
      options.desc = "MAKE IT RAIN !!";
    }
  ];
}
