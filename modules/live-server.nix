{
  lib,
  nixvimLib,
  pkgs,
  ...
}:
nixvimLib.nixvim.plugins.mkNeovimPlugin {
  name = "live-server";
  package = ["extraPlugins" "live-server"];

  extraOptions = {
    liveServerPackage = lib.mkPackageOption pkgs ["nodePackages" "live-server"] {
      nullable = true;
    };
  };

  extraConfig = cfg: {
    extraPackages = [cfg.liveServerPackage];
  };

  maintainers = [];
  url = "https://github.com/barrett-ruth/live-server.nvim";
  description = "Live reload local development servers inside of neovim";
}
