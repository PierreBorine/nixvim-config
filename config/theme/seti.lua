-- credits to original theme from https://github.com/jesseweed/seti-ui
-- this is a modified version of it

local M = {}

M.base_16 = {
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
}

M.base_30 = {
  white = M.base_16.base06,
  black = M.base_16.base00, -- usually your theme bg
  darker_black = "#121414", -- 6% darker than black
  black2 = "#212126", -- 6% lighter than black
  one_bg = "#2a2a30", -- 10% lighter than black
  one_bg2 = "#383840", -- 6% lighter than one_bg2
  one_bg3 = "#45454f", -- 6% lighter than one_bg3
  grey = "#42464e", -- 40% lighter than black (the % here depends so choose the perfect grey!) -- TODO
  grey_fg = "#565c64", -- 10% lighter than grey -- TODO
  grey_fg2 = "#6f737b", -- 5% lighter than grey -- TODO
  light_grey = "#6f737b", -- TODO
  red = M.base_16.base08,
  baby_pink = "#DE8C92", -- TODO
  pink = "#ff75a0", -- TODO
  line = "#363b3d", -- 15% lighter than black
  green = M.base_16.base0B,
  vibrant_green = "#90ca2e",
  nord_blue = M.base_16.base0D,
  blue = M.base_16.base04,
  yellow = M.base_16.base0A,
  sun = "#fadf72", -- 8% lighter than yellow
  purple = M.base_16.base0E,
  dark_purple = "#9068b0",
  teal = M.base_16.base02,
  orange = M.base_16.base09,
  cyan = M.base_16.base0C,
  statusline_bg = "#22262e", -- TODO
  lightbg = "#2d3139", -- TODO
  pmenu_bg = M.base_16.base04,
  folder_bg = M.base_16.base04,
}

M.polish_hl = {
  defaults = {
    FoldedIcon = { fg = M.base_16.base00 },
    FoldedText = { bg = M.base_16.base00 },
  },

  ["vim-illuminate"] = {
    IlluminatedWordText = { bg = M.base_30.black2, reverse = false },
    IlluminatedWordRead = { bg = M.base_30.black2, reverse = false },
    IlluminatedWordWrite = { bg = M.base_30.black2, reverse = false },
  },

  bufferline = {
    BufferLineFill = { bg = M.base_30.darker_black },
    BufferLineBackground = { bg = M.base_30.darker_black },
    BufferLineCloseButton = { bg = M.base_30.darker_black },
    BufferLineModifiedVisible = { bg = M.base_30.darker_black },
    BufferLineModified = { bg = M.base_30.darker_black },
    BufferLineSeparator = {
      bg = M.base_30.darker_black,
      fg = M.base_30.darker_black,
    },
  },

  nvimtree = {
    StatusLineNC = { bg = M.base_30.darker_black },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "seti")

return M
