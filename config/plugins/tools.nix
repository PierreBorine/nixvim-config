{
  config,
  pkgs,
  lib,
  ...
}: {
  userCommands = {
    Trim = {
      command = "lua MiniTrailspace.trim()";
      desc = "Trim all trailing whitespace";
    };
  };

  extraPackages = lib.optional (!config.settings.portable) pkgs.lazygit;

  dependencies.yazi.enable = config.settings.portable;
  plugins = {
    yazi = {
      enable = true;
      lazyLoad.settings = {
        keys = ["<leader>yy" "<leader>yc"];
        cmd = "Yazi";
      };
    };
    snacks.enable = true;
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

    trouble = {
      enable = true;
      lazyLoad.settings.cmd = "Trouble";
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
      lazyLoad.settings = {
        keys = ["<C-x>"];
        cmd = [
          "TSJToggle"
          "TSJSplit"
          "TSJJoin"
        ];
      };
      settings.use_default_keymaps = false;
    };

    telescope = {
      enable = true;
      lazyLoad.settings.cmd = "Telescope";
    };
  };

  keymaps = [
    {
      key = "<C-x>";
      action = "<cmd>TSJToggle<CR>";
      options.desc = "Toggle split/join";
    }
    {
      key = "<C-A>";
      action.__raw = ''
        function()
          require('nvim-toggler').toggle()
        end
      '';
      options.desc = "Invert the word under your cursor";
    }
    {
      key = "<leader>yc";
      action = "<cmd>Yazi<CR>";
      options.desc = "Open yazi at the current file";
    }
    {
      key = "<leader>yy";
      action = "<cmd>Yazi cwd<CR>";
      options.desc = "Open Yazi in nvim's working directory";
    }
    {
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options.desc = "Open LazyGit";
    }
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "Lists files in current working directory";
    }
    {
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options.desc = "Search for a string in current working directory";
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "Lists open buffers";
    }
    {
      key = "<leader>fo";
      action = "<cmd>Telescope oldfiles<CR>";
      options.desc = "Lists previously open files";
    }
    {
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle focus=false<CR>";
      options.desc = "Toggle Symbols";
    }
  ];
}
