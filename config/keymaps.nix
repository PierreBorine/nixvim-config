{
  keymaps = [
    # Most of these come from NvChad
    # https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
    {
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
      options.desc = "nvim-tree toggle window";
      options.silent = true;
    }
    {
      key = "<leader>e";
      action = "<cmd>NvimTreeFocus<CR>";
      options.desc = "nvim-tree focus window";
      options.silent = true;
    }
    {
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options.desc = "General Save file";
    }
    {
      key = "<C-c>";
      action = "<cmd>%y+<CR>";
      options.desc = "General Copy whole file";
    }
    {
      key = "<Esc>";
      action = "<cmd>noh<CR>";
      options.desc = "General Clear highlights";
    }
    {
      mode = "n";
      key = "<C-t>";
      action.__raw = ''
        function()
          require("minty.huefy").open()
        end
      '';
      options.desc = "Open color picker";
    }
    {
      mode = "n";
      key = "<RightMouse>";
      action.__raw = ''
        function()
        	vim.cmd.exec('"normal! \\<RightMouse>"')
        	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "gitsigns"
        	require("menu").open(options, { mouse = true })
        end
      '';
      options.desc = "Menu";
    }
    {
      mode = "n";
      key = "<leader>r";
      action = "<cmd>CellularAutomaton make_it_rain<CR>";
      options.desc = "MAKE IT RAIN !!";
    }
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>Markview splitToggle<CR>";
      options.desc = "Toggle Markview preview";
    }
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

    # Bufferline
    {
      mode = "n";
      key = "<tab>";
      action ="<cmd>BufferLineCycleNext<CR>";
      options.desc = "Cycle to next buffer tab";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<S-tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "Cycle to previous buffer";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-tab>";
      action ="<cmd>BufferLineMoveNext<CR>";
      options.desc = "Move current buffer forward";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-S-tab>";
      action = "<cmd>BufferLineMovePrev<CR>";
      options.desc = "Move current buffer backward";
      options.silent = true;
    }
    {
      key = "<leader>x";
      action = "<cmd>Bdelete<CR>";
      options.desc = "Close the current buffer";
      options.silent = true;
    }

    # Terminal
    {
      mode = "t";
      key = "<C-x>";
      action = "<C-\\><C-N>";
      options.desc = "Escape terminal mode";
      options.silent = true;
    }
    # {
    #   key = "<leader>h";
    #   action.__raw = ''
    #     function()
    #       require("nvchad.term").new { pos = "sp" }
    #     end
    #   '';
    #   options.desc = "New horizontal terminal";
    #   options.silent = true;
    # }
    # {
    #   key = "<leader>v";
    #   action.__raw = ''
    #     function()
    #       require("nvchad.term").new { pos = "vsp" }
    #     end
    #   '';
    #   options.desc = "New vertical terminal";
    #   options.silent = true;
    # }
    # {
    #   mode = ["n" "t"];
    #   key = "<A-h>";
    #   action.__raw = ''
    #     function()
    #       require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    #     end
    #   '';
    # }

    # Comments
    {
      mode = "n";
      key = "<leader>/";
      action = "gcc";
      options = {
        desc = "Toggle Comment";
        silent = true;
        remap = true;
      };
    }
    {
      mode = "v";
      key = "<leader>/";
      action = "gc";
      options = {
        desc = "Toggle Comment";
        silent = true;
        remap = true;
      };
    }
  ];
}
