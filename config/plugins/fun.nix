{
  config,
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [pkgs.vimPlugins.cellular-automaton-nvim];

  plugins = {
    wakatime.enable = config.settings.wakatime;
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

  extraPackages = lib.optional config.plugins.wakatime.enable pkgs.wakatime-cli;

  keymaps = [
    {
      mode = "n";
      key = "<leader>mr"; # make rain
      action = "<cmd>CellularAutomaton make_it_rain<CR>";
      options.desc = "MAKE IT RAIN !!";
    }
  ];
}
