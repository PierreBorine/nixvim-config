{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    cellular-automaton-nvim
  ];

  plugins = {
    vim-be-good = {
      enable = true;
      lazyLoad.settings.cmd = "VimBeGood";
    };
    sudoku = {
      enable = true;
      settings.persist_games = false;
    };
    typr = {
      enable = true;
      lazyLoad.settings.cmd = [ "Typr" "TyprStats" ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>r";
      action = "<cmd>CellularAutomaton make_it_rain<CR>";
      options.desc = "MAKE IT RAIN !!";
    }
  ];
}
