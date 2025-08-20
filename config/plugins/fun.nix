{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.cellular-automaton-nvim];

  plugins = {
    hardtime = {
      enable = false;
      settings = {
        max_count = 10;
      };
    };
    sudoku = {
      enable = false;
      settings.persist_games = false;
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
