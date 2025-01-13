{ vimUtils
, inputs
}:
vimUtils.buildVimPlugin {
  pname = "lualine-so-fancy.nvim";
  version = inputs.lualine-so-fancy.rev;
  src = inputs.lualine-so-fancy;
}
