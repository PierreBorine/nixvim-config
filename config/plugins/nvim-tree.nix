{mkKey, ...}: {
  plugins.nvim-tree = {
    enable = true;
    lazyLoad.settings = {
      cmd = [
        "NvimTreeToggle"
        "NvimTreeFocus"
        "NvimTreeOpen"
      ];
      keys = ["<leader>e"];
    };
    settings = {
      disable_netrw = true;
      hijack_cursor = true;
      sync_root_with_cwd = true;
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
      on_attach.__raw = ''
        function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
          vim.keymap.set("n", "?",        api.tree.toggle_help, opts("Help"))
          vim.keymap.set("n", "l",        api.node.open.edit,   opts("Open"))
          vim.keymap.set("n", "<Right>",  api.node.open.edit,   opts("Open"))
        end
      '';
    };
  };

  # Make sure netrw is disabled
  globals = {
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  keymaps = [
    (mkKey.mkKeymap "" "<leader>e" "<cmd>NvimTreeToggle<CR>" "nvim-tree toggle window")
  ];
}
