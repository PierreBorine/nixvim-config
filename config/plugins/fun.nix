{
  config,
  mkKey,
  pkgs,
  lib,
  ...
}: {
  plugins = {
    wakatime = {
      enable = config.settings.wakatime;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    hardtime = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        enabled = lib.mkDefault false;
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
    (mkKeymap "n" "<leader>uH" "<cmd>Hardtime toggle<CR>" "Toggle Hardtime")
    (mkKeymap "n" "<leader>uP" "<cmd>Precognition toggle<CR>" "Toggle Precognition")
    (mkKeymap "n" "<leader>uK" "<cmd>ShowkeysToggle<CR>" "Toggle ShowKey")
  ];
}
