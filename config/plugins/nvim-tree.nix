{
  plugins.nvim-tree = {
    enable = true;
    lazyLoad.settings = {
      cmd = [
        "NvimTreeToggle"
        "NvimTreeFocus"
        "NvimTreeOpen"
      ];
      keys = [
        "<C-n>"
        "<leader>e"
      ];
    };
    settings = {
      disable_netrw = true;
      hijack_cursor = true;
      sync_root_with_cwd = true;
      update_focused_file = {
        enable = true;
        update_root = true;
      };
      view.preserve_window_proportions = true;
      renderer = {
        root_folder_label = false;
        highlight_git = true;
        indent_markers.enable = true;
        icons = {
          glyphs = {
            default = "󰈚";
            folder = {
              default = "";
              empty = "";
              empty_open = "";
              open = "";
              symlink = "";
            };
            git.unmerged = "";
          };
        };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<CR>";
      options.desc = "nvim-tree toggle window";
      options.silent = true;
    }
    {
      key = "<leader>fe";
      action = "<cmd>NvimTreeToggle<CR>";
      options.desc = "nvim-tree toggle window";
      options.silent = true;
    }
  ];
}
