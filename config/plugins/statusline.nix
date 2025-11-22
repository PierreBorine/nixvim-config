{pkgs, ...}: {
  # TODO: Resolve issues & split into into different files

  extraPlugins = [pkgs.extraPlugins.lualine-so-fancy];
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "seti-ui";
        icons_enabled = true;
        component_separators = "";
        section_separators = {
          left = "";
          right = "";
        };
        ignore_focus = [
          "NvimTree"
          "TelescopePrompt"
          "Trouble"
          "lazygit"
          "yazi"
          "toggleterm"
        ];
        always_divide_middle = true;
        always_show_tabline = true;
        globalstatus = true;
        refresh.statusline = 1;
      };
      sections = {
        lualine_a = ["fancier_mode"];
        lualine_b = [
          "separator"
          # {
          #   __unkeyed.__raw = ''
          #     function()
          #       local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
          #       return vim.fn.pathshorten(path)
          #     end
          #   '';
          # }
          {
            __unkeyed-1 = "fancier_filetype";
            padding.left = 1;
            padding.right = 0;
            colored = true;
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
          "separator"
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
          "fancy_macro"
          {
            __unkeyed-1 = "diagnostics";
            sources = ["nvim_lsp"];
          }
          {
            __unkeyed-1 = "fancy_lsp_servers";
            icon = " ";
          }
          "separator"
        ];
        lualine_y = [
          "dirname"
          "separator"
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
            padding.left = 0;
            separator = "┊";
          }
          "progress"
        ];
      };
      inactive_sections = {
        lualine_a = [];
        lualine_b = [];
        lualine_c = [];
        lualine_x = [];
        lualine_y = [];
        lualine_z = [];
      };
    };
  };

  extraFiles = {
    "lua/lualine/component_e.lua".text =
      # lua
      ''
        local M = require("lualine.component"):extend()
        local utils = require("lualine.utils.utils")
        local hl = require("lualine.highlight")

        function M:init(options)
          M.super.init(self, options)
          self.options = vim.tbl_deep_extend('keep', self.options or {}, {mode_color = {}})
        end

        local function get_mode_suffix()
          return utils.is_focused() and hl.get_mode_suffix() or '_inactive'
        end

        ---@return string #rrggbb formatted color
        function M:get_mode_color()
          return utils.extract_highlight_colors('lualine_a' .. get_mode_suffix(), 'bg')
        end

        ---@param scope string bg | fg | sp
        ---@return string stl formatted hl group for hl_token
        function M:get_mode_hl(scope)
          local mode_suffix = get_mode_suffix()
          local mode = mode_suffix:sub(2)
          if not self.options.mode_color[mode] then
            -- FIXME: This code sonmehow creates more hl groups than needed
            local mode_hl = {}
            mode_hl[scope] = self:get_mode_color()
            local new_mode = {}
            new_mode[mode] = self:create_hl(mode_hl, 'mode')
            self.options.mode_color = vim.tbl_deep_extend('keep', self.options.mode_color or {}, new_mode)
          end
          return self:format_hl(self.options.mode_color[mode])
        end

        return M
      '';

    "lua/lualine/components/separator.lua".text =
      # lua
      ''
        local M = require('lualine.component'):extend()

        function M:init(options)
          local left = options.self.section < 'x'
          options.separator = left and { right = '' } or { left = '' }
          -- options.separator = left and { right = '◥' } or { left = '◤' }
          -- TODO: Somehow allow this to be transparent
          if options.color == nil then
            -- FIXME: un-hardcode this color ("darker_base00")
            options.color = { bg = "#181A1B" }
          end
          M.super.init(self, options)
        end

        function M:draw(default_highlight)
          self.status = ""
          self.applied_separator = ""
          self:apply_highlights(default_highlight)
          self:apply_section_separators()
          return self.status
        end

        return M
      '';

    "lua/lualine/components/fancier_filetype.lua".text =
      # lua
      ''
        local lualine_require = require('lualine_require')
        local modules = lualine_require.lazy_require {
          highlight = 'lualine.highlight',
          utils = 'lualine.utils.utils',
        }
        local M = lualine_require.require('lualine.component_e'):extend()

        local default_options = {
          colored = true,
          icon_only = false,
        }

        function M:init(options)
          M.super.init(self, options)
          self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
          self.icon_hl_cache = {}
        end

        function M.update_status()
          local ft = vim.bo.filetype or ""
          return modules.utils.stl_escape(ft)
        end

        function M:apply_icon()
          if not self.options.icons_enabled then
            return
          end

          local icon
          local ok, devicons = pcall(require, 'nvim-web-devicons')
          if ok then
            icon, _ = devicons.get_icon(vim.fn.expand('%:t'))
            if icon == nil then
              icon, _ = devicons.get_icon_by_filetype(vim.bo.filetype)
            end

            if icon == nil then
              icon = ''
            end
            if icon then
              icon = icon .. ' '
            end
            if self.options.colored then
              icon = self:get_mode_hl('fg') .. icon .. self:get_default_hl()
            end
          else
            ok = vim.fn.exists('*WebDevIconsGetFileTypeSymbol')
            if ok ~= 0 then
              icon = vim.fn.WebDevIconsGetFileTypeSymbol()
              if icon then
                icon = icon .. ' '
              end
            end
          end

          if not icon then
            return
          end

          if self.options.icon_only then
            self.status = icon
          elseif type(self.options.icon) == 'table' and self.options.icon.align == 'right' then
            self.status = self.status .. ' ' .. icon
          else
            self.status = icon .. self.status
          end
        end

        return M
      '';

    "lua/lualine/components/dirname.lua".text =
      # lua
      ''
        local M = require("lualine.component_e"):extend()

        function M:init(options)
          options.icon = { "", color = { fg = self:get_mode_color() } }
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

        function M:apply_icon()
          local icon = self.options.icon
          if self.options.icons_enabled and icon then
            if type(icon) == 'table' then
              icon = icon[1]
            end
            if
              self.options.icon_color_highlight
              and type(self.options.icon) == 'table'
              and self.options.icon.align == 'right'
            then
              self.status = table.concat {
                self.status,
                ' ',
                self:format_hl(self.options.icon_color_highlight),
                icon,
                self:get_default_hl(),
              }
            elseif self.options.icon_color_highlight then
              self.status = table.concat {
                self:get_mode_hl('fg'),
                icon,
                self:get_default_hl(),
                ' ',
                self.status,
              }
            elseif type(self.options.icon) == 'table' and self.options.icon.align == 'right' then
              self.status = table.concat({ self.status, icon }, ' ')
            else
              self.status = table.concat({ icon, self.status }, ' ')
            end
          end
        end

        return M
      '';

    "lua/lualine/components/fancier_mode.lua".text =
      # lua
      ''
        local M = require('lualine.component'):extend()

        function M:init(options)
          options.width = options.width or 8
          if options.padding == nil then
            options.padding = { left = 1 }
          end
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
