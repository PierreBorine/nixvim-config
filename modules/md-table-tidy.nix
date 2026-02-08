{lib, ...}:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "md-table-tidy";
  package = ["extraPlugins" "md-table-tidy"];

  maintainers = [];
  url = "https://github.com/timantipov/md-table-tidy.nvim";
  description = "A lightweight Neovim plugin for formatting markdown tables.";
}
