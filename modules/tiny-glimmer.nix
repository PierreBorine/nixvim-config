{
  lib,
  pkgs,
  ...
}:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "tiny-glimmer";
  package = "tiny-glimmer-nvim";

  # Somehow this isn't done automatically
  extraPlugins = [pkgs.vimPlugins.tiny-glimmer-nvim];

  maintainers = [];
  url = "https://github.com/rachartier/tiny-glimmer.nvim";
  description = "A tiny plugin that adds subtle animations to various operations";
}
