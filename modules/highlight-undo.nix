{nixvimLib, ...}:
nixvimLib.nixvim.plugins.mkNeovimPlugin {
  name = "highlight-undo";
  package = "highlight-undo-nvim";

  maintainers = [];
  url = "https://github.com/tzachar/highlight-undo.nvim";
  description = "Highlight changed text after any text changing operation";
}
