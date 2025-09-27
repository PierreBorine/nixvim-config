{
  keymaps = [
    {
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options.desc = "Save file";
    }
    {
      key = "<C-c>";
      action = "<cmd>%y+<CR>";
      options.desc = "Copy whole file";
    }
    {
      key = "<Esc>";
      action = "<cmd>noh<CR>";
      options.desc = "Clear highlights";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Increate indentation of selection";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Decrease indentation of selection";
    }
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>enew<CR>";
      options.desc = "New file";
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      options.desc = "Increase Window Height";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      options.desc = "Decrease Window Height";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      options.desc = "Increase Window Width";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      options.desc = "Decrease Window Width";
    }
    {
      key = "<C-t>";
      action.__raw = ''function() require("minty.huefy").open() end'';
      options.desc = "Open color picker";
    }
    {
      key = "<RightMouse>";
      action.__raw = ''
        function()
          vim.cmd.exec('"normal! \\<RightMouse>"')
          local options = vim.bo.ft == "NvimTree" and "nvimtree" or "gitsigns"
          require("menu").open(options, {mouse = true })
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
