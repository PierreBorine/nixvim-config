{lib, ...}:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "header-42-nvim";
  package = ["extraPlugins" "header-42-nvim"];

  moduleName = "42header";

  maintainers = [];
  url = "https://github.com/Diogo-ss/42-header.nvim";
  description = "Neovim header for 42 projects. Written in Lua.";
}
