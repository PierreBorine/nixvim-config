{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.settings.life == 42) {
    plugins = {
      c-formatter-42.enable = true;
      header-42-nvim = {
        enable = true;
        lazyLoad.settings = {
          cmd = "Stdheader";
          keys = ["<F1>"];
        };
        settings = {
          auto_update = false;
          git = {
            enabled = true;
            ${
              if config.dependencies.git.enable
              then "bin"
              else null
            } =
              lib.getExe config.dependencies.git.package;
          };
        };
      };
    };
  };
}
