{pkgs, ...}: {
  globals.base46_cache.__raw = ''vim.fn.stdpath "data" .. "/base46/"'';

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
    base46
  ];

  extraConfigLua = ''
    require('base46').load_all_highlights()
  '';

  extraFiles = {
    "lua/chadrc.lua".text =
      # lua
      ''
        local options = {
          base46 = {
            theme = "onedark",
            changed_themes = {
              onedark = {
                base_16 = {
                  base00 = "#151718",
                  base01 = "#282a2b",
                  base02 = "#3B758C",
                  base03 = "#41535B",
                  base04 = "#43a5d5",
                  base05 = "#d6d6d6",
                  base06 = "#eeeeee",
                  base07 = "#ffffff",
                  base08 = "#Cd3f45",
                  base09 = "#db7b55",
                  base0A = "#e6cd69",
                  base0B = "#9fca56",
                  base0C = "#55dbbe",
                  base0D = "#55b5db",
                  base0E = "#a074c4",
                  base0F = "#8a553f",
                };
                base_30 = {
                  white = "#eeeeee",
                  black = "#151718", -- usually your theme bg
                  darker_black = "#121414", -- 6% darker than black
                  black2 = "#212126", -- 6% lighter than black
                  one_bg = "#2a2a30", -- 10% lighter than black
                  one_bg2 = "#383840", -- 6% lighter than one_bg2
                  one_bg3 = "#45454f", -- 6% lighter than one_bg3
                  -- grey = "#282a2b", -- 40% lighter than black (the % here depends so choose the perfect grey!)
                  -- grey_fg = "#404345", -- 10% lighter than grey
                  -- grey_fg2 = "#343638", -- 5% lighter than grey
                  -- light_grey = "#4c4f52",
                  red = "#Cd3f45",
                  -- baby_pink = "",
                  -- pink = "",
                  line = "#363b3d", -- 15% lighter than black
                  green = "#9fca56",
                  vibrant_green = "#90ca2e",
                  nord_blue = "#3b92bd",
                  blue = "#43a5d5",
                  seablue = "#55b5db",
                  yellow = "#e6cd69",
                  sun = "#fadf72", -- 8% lighter than yellow
                  purple = "#a074c4",
                  dark_purple = "#9068b0",
                  teal = "#3B758C",
                  orange = "#db7b55",
                  cyan = "#55dbbe",
                  -- statusline_bg = "",
                  -- lightbg = "",
                  -- pmenu_bg = "",
                  -- folder_bg = ""
                },
              },
            },
            transparency = false,
            theme_toggle = { "onedark" },
            hl_add = {
              IlluminatedWordRead = { bold = true, bg = "#212126" },
              IlluminatedWordRead = { bold = true, bg = "#212126" },
              IlluminatedWordWrite = { bold = true, bg = "#212126" },
            },
            hl_override = {},
          },
        }
        return options
      '';
  };
}
