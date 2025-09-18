{lib, ...}:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "nvim-toggler";
  package = ["extraPlugins" "nvim-toggler"];

  maintainers = [];
  url = "https://github.com/nguyenvukhang/nvim-toggler";
  description = "invert text in vim, purely with lua";
}
