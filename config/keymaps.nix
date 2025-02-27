{
  keymaps = [
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
      mode = "v";
      key = "<Tab>";
      action = ">gv";
      options.desc = "Increate indentation of selection";
    }
    {
      mode = "v";
      key = "<S-Tab>";
      action = "<gv";
      options.desc = "Decrease indentation of selection";
    }
    {
      key = "<C-t>";
      action.__raw = ''
        function()
          require("minty.huefy").open()
        end
      '';
      options.desc = "Open color picker";
    }
    {
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
    # {
    #   mode = "t";
    #   key = "<C-x>";
    #   action = "<C-\\><C-N>";
    #   options.desc = "Escape terminal mode";
    #   options.silent = true;
    # }
  ];
}
