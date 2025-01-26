{pkgs, lib, ...}: let
  inherit (lib.generators) toLua;
  c = rec {
    base_16 = {
      base00 = "#151718";
      base01 = "#282a2b";
      base02 = "#3B758C";
      base03 = "#41535B";
      base04 = "#43a5d5";
      base05 = "#d6d6d6";
      base06 = "#eeeeee";
      base07 = "#ffffff";
      base08 = "#Cd3f45";
      base09 = "#db7b55";
      base0A = "#e6cd69";
      base0B = "#9fca56";
      base0C = "#55dbbe";
      base0D = "#55b5db";
      base0E = "#a074c4";
      base0F = "#8a553f";
    };
    base_30 = {
      white = base_16.base06;
      black = base_16.base00; # usually your theme bg
      darker_black = "#121414"; # 6% darker than black
      black2 = "#212126"; # 6% lighter than black
      one_bg = "#2a2a30"; # 10% lighter than black
      one_bg2 = "#383840"; # 6% lighter than one_bg2
      one_bg3 = "#45454f"; # 6% lighter than one_bg3
      # grey = "#282a2b"; # 40% lighter than black (the % here depends so choose the perfect grey!)
      # grey_fg = "#404345"; # 10% lighter than grey
      # grey_fg2 = "#343638"; # 5% lighter than grey
      # light_grey = "#4c4f52";
      red = base_16.base08;
      # baby_pink = "";
      # pink = "";
      line = "#363b3d"; # 15% lighter than black
      green = base_16.base0B;
      vibrant_green = "#90ca2e";
      nord_blue = "#3b92bd";
      blue = base_16.base04;
      seablue = base_16.base0D;
      yellow = base_16.base0A;
      sun = "#fadf72"; # 8% lighter than yellow
      purple = base_16.base0E;
      dark_purple = "#9068b0";
      teal = base_16.base02;
      orange = base_16.base09;
      cyan = base_16.base0C;
      # statusline_bg = "";
      # lightbg = "";
      # pmenu_bg = "";
      # folder_bg = ""
    };
  };
in {
  globals.base46_cache.__raw = ''vim.fn.stdpath "data" .. "/base46/"'';

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
    base46
  ];

  extraConfigLua = ''
    require('base46').load_all_highlights()
  '';

  plugins = {
    toggleterm.settings.highlights = {
      Normal = {
        guibg = c.base_30.darker_black;
      };
    };
    trim.settings.highlight_bg = c.base_16.base08;
    bufferline.settings.highlights = {
      background.bg = c.base_30.darker_black;
    };
  };

  extraFiles = let
    hl_add = {
      FoldedIcon.fg = c.base_16.base00;
      FoldedText.bg = c.base_16.base00;

      # Illuminate
      IlluminatedWordText = { bold = true; bg = c.base_30.black2; };
      IlluminatedWordRead = { bold = true; bg = c.base_30.black2; };
      IlluminatedWordWrite = { bold = true; bg = c.base_30.black2; };
    };

    hl_override = {

    };
  in {
    "lua/chadrc.lua".text =
      # lua
      ''
        local options = {
          base46 = {
            theme = "onedark",
            changed_themes = {
              onedark = ${toLua {indent = "      ";} c},
            },
            transparency = false,
            theme_toggle = { "onedark" },
            hl_add = ${toLua {indent = "    ";} hl_add},
            hl_override = ${toLua {indent = "    ";} hl_override},
          },
        }
        return options
      '';
  };
}
