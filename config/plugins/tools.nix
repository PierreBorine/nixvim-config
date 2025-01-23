{
  plugins = {
    yazi = {
      enable = true;
      lazyLoad.settings.cmd = "Yazi";
    };
    lazygit.enable = true;
    fugitive.enable = true;
    trouble = {
      enable = true;
      lazyLoad.settings.cmd = "Trouble";
      settings = {
        auto_jump = true;
        open_no_results = true;
      };
    };

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

    {
      key = "<leader>tx";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options.desc = "Diagnostics (Trouble)";
    }
    {
      key = "<leader>tX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }
    {
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle focus=false<CR>";
      options.desc = "Symbols (Trouble)";
    }
    {
      key = "<leader>cl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<CR>";
      options.desc = "LSP Definitions / references / ... (Trouble)";
    }
    {
      key = "<leader>tL";
      action = "<cmd>Trouble loclist toggle<CR>";
      options.desc = "Location List (Trouble)";
    }
    {
      key = "<leader>tQ";
      action = "<cmd>Trouble qflist toggle<CR>";
      options.desc = "Quickfix List (Trouble)";
    }
  ];
}
