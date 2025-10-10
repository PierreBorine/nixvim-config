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
    flake = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "Path to the user's flake";
    };
  };
}
