{
  userCommands = {
    Trim = {
      command = "lua MiniTrailspace.trim()";
      desc = "Trim all trailing whitespace";
    };
  };

  plugins = {
    yazi = {
      enable = true;
      lazyLoad.settings.cmd = "Yazi";
    };
    lazygit.enable = true;

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

        filetypes = {
          __unkeyed-1 = "*";
          css.names = true;
          scss.names = true;
        };
      };
    };

    nvim-toggler = {
      enable = true;
      settings = {
        remove_default_keybinds = true;
        inverses = {
          enabled = "disabled";
        };
      };
    };

    treesj = {
      enable = true;
      settings.use_default_keymaps = false;
    };
  };

  keymaps = [
    {
      key = "<C-x>";
      action.__raw = ''
        function()
          require('treesj').toggle()
        end
      '';
      options.desc = "Toggle split/join";
    }
    {
      key = "<C-a>";
      action.__raw = ''
        function()
          require('nvim-toggler').toggle()
        end
      '';
      options.desc = "Invert the word under your cursor";
    }
    {
      key = "<leader>yy";
      action = "<cmd>Yazi<CR>";
      options.desc = "Open yazi at the current file";
    }
    {
      key = "<leader>yc";
      action = "<cmd>Yazi cwd<CR>";
      options.desc = "Open Yazi in nvim's working directory";
    }
    {
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options.desc = "Open LazyGit";
    }
  ];
}
