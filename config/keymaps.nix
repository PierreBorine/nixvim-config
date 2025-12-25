{
  config,
  mkKey,
  lib,
  ...
}: let
  inherit (mkKey) mkKeymap mkKeymapWithOpts;
in {
  extraConfigLua = ''
    ${lib.optionalString config.lsp.inlayHints.enable ''Snacks.toggle.inlay_hints():map("<leader>uh")''}
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
  '';

  keymaps = [
    {
      mode = ["n" "v"];
      key = ";";
      action = ":";
    }
    (mkKeymapWithOpts ["n" "x"] "j" "v:count == 0 ? 'gj' : 'j'" "Down" {expr = true;})
    (mkKeymapWithOpts ["n" "x"] "<Down>" "v:count == 0 ? 'gj' : 'j'" "Down" {expr = true;})
    (mkKeymapWithOpts ["n" "x"] "k" "v:count == 0 ? 'gk' : 'k'" "Up" {expr = true;})
    (mkKeymapWithOpts ["n" "x"] "<Up>" "v:count == 0 ? 'gk' : 'k'" "Up" {expr = true;})
    (mkKeymap "" "<C-s>" "<cmd>w<CR>" "Save file")
    (mkKeymap "" "<C-c>" "<cmd>%y+<CR>" "Copy whole file")
    (mkKeymap "" "<Esc>" "<cmd>noh<CR>" "Clear highlights")
    (mkKeymap "n" "<leader>ut" "<cmd>TransparencyToggle<CR>" "Toggle transparency")
    (mkKeymap "x" ">" ">gv" "Increase indentation of selection")
    (mkKeymap "x" "<" "<gv" "Decrease indentation of selection")
    (mkKeymap "n" "<leader>fn" "<cmd>enew<CR>" "New file")
    (mkKeymap "n" "<C-Up>" "<cmd>resize +2<CR>" "Increase Window Height")
    (mkKeymap "n" "<C-Down>" "<cmd>resize -2<CR>" "Decrease Window Height")
    (mkKeymap "n" "<C-Right>" "<cmd>vertical resize +2<CR>" "Increase Window Width")
    (mkKeymap "n" "<C-Left>" "<cmd>vertical resize -2<CR>" "Decrease Window Height")
  ];
}
