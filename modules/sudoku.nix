{nixvimLib, ...}:
nixvimLib.nixvim.plugins.mkNeovimPlugin {
  name = "sudoku";
  package = ["extraPlugins" "sudoku"];

  maintainers = [];
  url = "https://github.com/jim-fx/sudoku.nvim";
  description = "Got time to spend outside of your terminal? Now presenting: sudoku.nvim";
}
