{
  config,
  mkKey,
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

  dependencies.git.enable = !config.settings.portable;
  dependencies.lazygit.enable = !config.settings.portable;
  dependencies.yazi.enable = !config.settings.portable;
  dependencies.coreutils.enable = !config.settings.portable;

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

    grug-far.enable = true;

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

    flash.enable = true;

    telescope = {
      enable = true;
      lazyLoad.settings.cmd = "Telescope";
    };
  };

  keymaps = let
    inherit (mkKey) mkKeymap;
  in [
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
      mode = ["n" "x"];
      key = "<leader>sr";
      action.__raw = ''
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end
      '';
      options.desc = "Search and Replace";
    }

    (mkKeymap "" "<leader>yc" "<cmd>Yazi<CR>" "Open yazi at the current file")
    (mkKeymap "" "<leader>yy" "<cmd>Yazi cwd<CR>" "Open Yazi in nvim's working directory")
    (mkKeymap "" "<leader>gg" "<cmd>LazyGit<CR>" "Open LazyGit")

    (mkKeymap "" "<leader>ff" "<cmd>Telescope find_files<CR>" "Lists files in current working directory")
    (mkKeymap "" "<leader>fg" "<cmd>Telescope live_grep<CR>" "Search for a string in current working directory")
    (mkKeymap "" "<leader>fb" "<cmd>Telescope buffers<CR>" "Lists open buffers")
    (mkKeymap "" "<leader>fo" "<cmd>Telescope oldfiles<CR>" "Lists previously open files")
    (mkKeymap "" "<leader>cs" "<cmd>Trouble symbols toggle focus=false<CR>" "Toggle Symbols")

    (mkKeymap ["n" "x" "o"] "s" {__raw = "function()require('flash').jump()end";} "Flash")
    (mkKeymap ["n" "x" "o"] "S" {__raw = "function()require('flash').treesitter()end";} "Flash Treesitter")
  ];
}
