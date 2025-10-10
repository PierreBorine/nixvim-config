{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.settings.life == 42) {
    plugins = {
      c-formatter-42.enable = true;
      header-42.enable = true;
    };
  };
}
