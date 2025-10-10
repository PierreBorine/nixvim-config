{
  lib,
  pkgs,
  ...
}:
lib.nixvim.plugins.mkVimPlugin {
  name = "c-formatter-42";
  package = ["extraPlugins" "c-formatter-42"];

  extraOptions = {
    c-formatter-42Package = lib.mkPackageOption pkgs "c-formatter-42" {
      nullable = true;
    };
    norminettePackage = lib.mkPackageOption pkgs "norminette" {
      nullable = true;
    };
  };

  extraConfig = cfg: {
    extraPackages = [
      cfg.c-formatter-42Package
      cfg.norminettePackage
    ];
  };

  maintainers = [];
  url = "https://github.com/cacharle/c_formatter_42.vim";
  description = "Vim plugin for the c_formatter_42 formatter";
}
