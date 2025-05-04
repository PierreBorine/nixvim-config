{pkgs, ...}: {
  extraPlugins = [
    pkgs.extraPlugins.lualine-so-fancy
  ];
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "seti-ui";
        icons_enabled = true;
        component_separators = { left = ""; right = "";};
        section_separators = { left = ""; right = "";};
        ignore_focus = [];
        always_divide_middle = true;
        always_show_tabline = true;
        globalstatus = true;
        refresh.statusline = 1;
      };
      sections = {
        lualine_a = [{
          __unkeyed-1 = "fancier_mode";
          padding.left = 1;
          width = 8;
        }];
        lualine_b = [
          {
            __unkeyed-1 = "filetype";
            padding.left = 1;
            padding.right = 0;
            colored = false;
            icon_only = true;
          }
          {
            __unkeyed-1 = "filename";
            padding.left = 0;
            padding.right = 1;
            symbols = {
              modified = "● ";
              readonly = " ";
              unnamed = "";
              newfile = "";
            };
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            colored = false;
            symbols = {
              added = " ";
              removed = " ";
              modified = " ";
            };
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "diagnostics";
            sources = ["nvim_lsp"];
          }
          {
            __unkeyed-1 = "fancy_lsp_servers";
            icon = " ";
          }
        ];
        lualine_y = ["dirname"];
        lualine_z = ["progress"];
      };
      inactive_sections = {
        lualine_a = [];
        lualine_b = [];
        lualine_c = [];
        lualine_x = [];
        lualine_y = [];
        lualine_z = [];
      };
      extensions = [/*"aerial"*/];
    };
  };

  extraFiles = {
    "lua/lualine/components/dirname.lua".text =
      # lua
      ''
        local M = require("lualine.component"):extend()

        function M:init(options)
          options.icon = options.icon or { "", color = { fg = "#43a5d5" } }
          if options.substitute_home == nil then
            options.substitute_home = true
          end
          M.super.init(self, options)
        end

        function M:update_status()
          local cwd = vim.fn.getcwd()
          local home = os.getenv("HOME")
          if self.options.substitute_home and cwd == home then
            return "~"
          end
          return string.gsub(cwd, "(.*/)(.*)", "%2")
        end

        return M
      '';

    "lua/lualine/components/fancier_mode.lua".text =
      # lua
      ''
        local M = require('lualine.component'):extend()

        function M:init(options)
          options.width = options.width or 3
          M.super.init(self, options)
        end

        function M:update_status()
          local text = require("lualine.utils.mode").get_mode()
          local spaces = self.options.width - vim.fn.strdisplaywidth(text)
          local left = math.floor(spaces / 2)
          local right = spaces - left
          return string.rep(" ", left) .. text .. string.rep(" ", right)
        end

        return M
      '';
  };
}
