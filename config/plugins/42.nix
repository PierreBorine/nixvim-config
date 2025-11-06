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
        settings = {
          auto_update = false;
          git = {
            enabled = true;
            bin = lib.getExe config.dependencies.git.package;
          };
        };
      };
    };
  };
}
