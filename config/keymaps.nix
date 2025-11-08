{
  config,
  mkKey,
  lib,
  ...
}: let
  inherit (mkKey) mkKeymap mkKeymap' mkKeymapWithOpts;
in {
  extraConfigLua = ''
    ${lib.optionalString config.lsp.inlayHints.enable ''Snacks.toggle.inlay_hints():map("<leader>uh")''}
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
  '';

  keymaps = [
    (mkKeymap' ["n" "v"] ";" ":")
    (mkKeymapWithOpts ["n" "x"] "j" "v:count == 0 ? 'gj' : 'j'" "Down" {expr = true;})
    (mkKeymapWithOpts ["n" "x"] "<Down>" "v:count == 0 ? 'gj' : 'j'" "Down" {expr = true;})
    (mkKeymapWithOpts ["n" "x"] "k" "v:count == 0 ? 'gk' : 'k'" "Up" {expr = true;})
    (mkKeymapWithOpts ["n" "x"] "<Up>" "v:count == 0 ? 'gk' : 'k'" "Up" {expr = true;})
    (mkKeymap "" "<C-s>" "<cmd>w<CR>" "Save file")
    (mkKeymap "" "<C-c>" "<cmd>%y+<CR>" "Copy whole file")
    (mkKeymap "" "<Esc>" "<cmd>noh<CR>" "Clear highlights")
    (mkKeymap "n" "<leader>ut" "<cmd>TransparencyToggle<CR>" "Toggle transparency")
    (mkKeymap "n" ">" ">>" "Increase indentation")
    (mkKeymap "n" "<" "<<" "Decrease indentation")
    (mkKeymap "x" ">" ">gv" "Increase indentation of selection")
    (mkKeymap "x" "<" "<gv" "Decrease indentation of selection")
    (mkKeymap "n" "<leader>fn" "<cmd>enew<CR>" "New file")
    (mkKeymap "n" "<C-Up>" "<cmd>resize +2<CR>" "Increase Window Height")
    (mkKeymap "n" "<C-Down>" "<cmd>resize -2<CR>" "Decrease Window Height")
    (mkKeymap "n" "<C-Right>" "<cmd>vertical resize +2<CR>" "Increase Window Width")
    (mkKeymap "n" "<C-Left>" "<cmd>vertical resize -2<CR>" "Decrease Window Height")
    {
      key = "<C-t>";
      action.__raw = ''function() require("minty.huefy").open() end'';
      options.desc = "Open color picker";
    }
    {
      key = "<RightMouse>";
      action.__raw = ''
        function()
          vim.cmd.exec('"normal! \\<RightMouse>"')
          local options = vim.bo.ft == "NvimTree" and "nvimtree" or "gitsigns"
          require("menu").open(options, {mouse = true })
        end
      '';
      options.desc = "Menu";
    }
  ];
}
