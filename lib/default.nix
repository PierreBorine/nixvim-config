# https://github.com/niksingh710/nvix
{
  mkKey = rec {
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
      };
    };

    # Keymap without description
    mkKeymap' = mode: key: action:
      mkKeymap mode key action null;

    mkKeymapWithOpts = mode: key: action: desc: options:
      (mkKeymap mode key action desc) // {inherit options;};
  };
}
