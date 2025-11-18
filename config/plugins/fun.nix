{
  config,
  mkKey,
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [pkgs.vimPlugins.cellular-automaton-nvim];

  plugins = {
    wakatime.enable = config.settings.wakatime;
    hardtime = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        enabled = false;
        max_count = 10;
      };
    };
    precognition = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings.startVisible = false;
    };
    showkeys = {
      enable = true;
      lazyLoad.settings.cmd = "ShowkeysToggle";
      settings = {
        excluded_modes = ["i"];
        position = "top-right";
        maxkeys = 4;
      };
    };
  };

  extraPackages = lib.optional config.plugins.wakatime.enable pkgs.wakatime-cli;

  keymaps = let
    inherit (mkKey) mkKeymap;
  in [
    (mkKeymap "n" "<leader>uR" "<cmd>CellularAutomaton make_it_rain<CR>" "MAKE IT RAIN !!")
    (mkKeymap "n" "<leader>uH" "<cmd>Hardtime toggle<CR>" "Toggle Hardtime")
    (mkKeymap "n" "<leader>uP" "<cmd>Precognition toggle<CR>" "Toggle Precognition")
  ];
}
