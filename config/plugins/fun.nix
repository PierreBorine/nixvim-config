{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    cellular-automaton-nvim
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>r";
      action = "<cmd>CellularAutomaton make_it_rain<CR>";
      options.desc = "MAKE IT RAIN !!";
    }
  ];
}
