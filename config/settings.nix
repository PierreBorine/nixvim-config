{
  config,
  lib,
  ...
}: let
  cfg = config.settings;

  supportedLanguages = [
    "Nix"
    "C"
    "Rust"
    "QML"
    "Python"
    "CS"
    "Web"
    # "Haskell"
    "Markdown"
  ];
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
    languages = lib.mkOption {
      type = with lib.types;
        either (enum ["All"])
        (listOf (enum supportedLanguages));
      default =
        if cfg.maximal
        then "All"
        else [];
      description = "Languages to support";
    };
    portable = lib.mkEnableOption "bundle friendly configuration";
    transparent = lib.mkEnableOption "enable transparency by default";
  };
  options.lib = lib.mkOption {type = lib.types.attrsOf lib.types.anything;};

  config.lib.isLang = lang:
    config.settings.languages == "All" || lib.elem lang config.settings.languages;
}
