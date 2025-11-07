{lib, ...}: let
  modules =
    lib.filterAttrs
    (n: _: lib.hasSuffix ".nix" n && n != "default.nix")
    (builtins.readDir ./.);
in {
  imports = lib.mapAttrsToList (n: _: ./. + "/${n}") modules;
}
