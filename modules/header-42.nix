{lib, ...}:
lib.nixvim.plugins.mkVimPlugin {
  name = "header-42";
  package = ["extraPlugins" "header-42"];

  maintainers = [];
  url = "https://github.com/42Paris/42header";
  description = "42 standard header for vim editor";
}
