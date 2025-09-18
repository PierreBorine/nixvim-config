{lib, ...}: {
  options.settings = {
    wakatime = lib.mkEnableOption "wakatime";
    flake = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "Path to the user's flake";
    };
  };
}
