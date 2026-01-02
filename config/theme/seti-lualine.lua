local c = {
  darker_base00 = "#181A1B",
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

return {
  normal = {
    a = { fg = c.base00, bg = c.base04, gui = 'bold' },
    b = { fg = c.base06, bg = c.base01 },
    c = { fg = c.base03, bg = c.darker_base00 },
  },
  inactive = {
    a = { fg = c.base05, bg = c.base01, gui = 'bold' },
    b = { fg = c.base05, bg = c.base01 },
    c = { fg = c.base05, bg = c.darker_base00 },
  },

  visual = {
    a = { fg = c.base00, bg = c.base08, gui = 'bold' },
  },
  replace = {
    a = { fg = c.base00, bg = c.base0A, gui = 'bold' },
  },
  insert = {
    a = { fg = c.base00, bg = c.base0B, gui = 'bold' },
  },
  terminal = {
    a = { fg = c.base00, bg = c.base0E, gui = 'bold' },
  },
  command = {
    a = { fg = c.base00, bg = c.base0C, gui = 'bold' },
  },
}
