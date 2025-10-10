prev: inputs: {
  extraPlugins = prev.callPackage ./plugins.nix {inherit inputs;};
}
