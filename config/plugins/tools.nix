{
  plugins = {
    yazi = {
      enable = true;
      lazyLoad.settings.cmd = "Yazi";
    };
    lazygit.enable = true;
    fugitive.enable = true;
    colorizer = {
      enable = true;
      lazyLoad.settings.event = "BufReadPre";
      settings = {
        lazy_load = true;
        user_default_options = {
          names = false;
          css = true;
          sass = {
            enable = true;
            parsers = ["css"];
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>yy";
      action = "<cmd>Yazi<CR>";
      options.desc = "Open yazi at the current file";
    }
    {
      mode = "n";
      key = "<leader>yc";
      action = "<cmd>Yazi cwd<CR>";
      options.desc = "Open Yazi in nvim's working directory";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options.desc = "Open LazyGit";
    }
  ];
}
