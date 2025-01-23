{
  nixvimLib,
  pkgs,
  ...
}:
nixvimLib.nixvim.plugins.mkNeovimPlugin {
  name = "typr";
  package = "nvzone-typr";

  extraConfig = {
    extraPackages = [ pkgs.vimPlugins.nvzone-volt ];
  };

  maintainers = [];
  url = "https://github.com/nvzone/typr";
  description = "Typing practice plugin with good ui! for Neovim";
}
