prev: inputs: {
  c-formatter-42 = prev.python3Packages.callPackage ./c-formatter-42.nix {};
  extraPlugins = prev.callPackage ./plugins.nix {inherit inputs;};
}
