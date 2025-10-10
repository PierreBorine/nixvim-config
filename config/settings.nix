{
  config,
  lib,
  ...
}: let
  cfg = config.settings;
in {
  options.settings = {
    maximal = lib.mkEnableOption "maximal configuration";
    wakatime = lib.mkEnableOption "wakatime" // {default = cfg.maximal;};
    life = lib.mkOption {
      type = lib.types.enum [null 42];
      default =
        if cfg.maximal
        then 42
        else null;
      description = "Whether to enable 42 school related options";
    };
    flake = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "Path to the user's flake";
    };
  };
}
