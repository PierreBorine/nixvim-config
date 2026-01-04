{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.settings.life == 42) {
    plugins = {
      formatter-42 = {
        enable = true;
        lazyLoad.settings = {
          cmd = "CFormat42";
          keys = ["<F2>"];
        };
      };
      header-42-nvim = {
        enable = true;
        lazyLoad.settings = {
          cmd = "Stdheader";
          keys = ["<F1>"];
        };
        settings = {
          auto_update = false;
          git = {
            enabled = true;
            ${
              if config.dependencies.git.enable
              then "bin"
              else null
            } =
              lib.getExe config.dependencies.git.package;
          };
        };
      };
    };

    keymaps = lib.singleton {
      mode = "n";
      key = "<F2>";
      action = "<cmd>CFormat42<CR>";
      options.desc = "Format current buffer with the 42 Norms";
    };
  };
}
