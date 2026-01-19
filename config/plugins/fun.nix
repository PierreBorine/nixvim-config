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
      lazyLoad.settings = {
        event = "DeferredUIEnter";
        after =
          # lua
          ''
            function()
              local hardtime = require("hardtime")
              Snacks.toggle({
                name = "hardtime",
                get = function()
                  return hardtime.is_plugin_enabled
                end,
                set = function(state)
                  if state then
                    hardtime.enable()
                  else
                    hardtime.disable()
                  end
                end,
              }):map("<leader>uH")
            end
          '';
      };
      settings = {
        enabled = lib.mkDefault false;
        max_count = 10;
      };
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
    (mkKeymap "n" "<leader>uK" "<cmd>ShowkeysToggle<CR>" "Toggle ShowKey")
  ];
}
