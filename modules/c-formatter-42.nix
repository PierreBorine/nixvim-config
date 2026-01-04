{
  pkgs,
  lib,
  ...
}:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "formatter-42";
  moduleName = "42-formatter";
  package = ["extraPlugins" "c-formatter-42"];

  extraOptions = {
    c-formatter-42_package = lib.mkPackageOption pkgs "c-formatter-42" {
      nullable = true;
    };
    norminette_package = lib.mkPackageOption pkgs "norminette" {
      nullable = true;
    };
  };

  extraConfig = cfg: {
    extraPackages = [
      cfg.c-formatter-42_package
      cfg.norminette_package
    ];
  };

  maintainers = [];
  url = "https://github.com/Diogo-ss/42-C-Formatter.nvim";
  description = "Format C/C++ according to the 42 norm directly in Neovim";
}
