{
  vimUtils,
  inputs,
}: let
  inherit (vimUtils) buildVimPlugin;
in {
  c-formatter-42 = buildVimPlugin {
    pname = "c-formatter-42.vim";
    version = inputs.c-formatter-42.rev;
    src = inputs.c-formatter-42;
  };

  header-42-nvim = buildVimPlugin {
    pname = "42-header.nvim";
    version = inputs.header-42-nvim.rev;
    src = inputs.header-42-nvim;
  };

  header-42 = buildVimPlugin {
    pname = "42-header.vim";
    version = inputs.header-42.rev;
    src = inputs.header-42;
  };

  lualine-so-fancy = buildVimPlugin {
    pname = "lualine-so-fancy.nvim";
    version = inputs.lualine-so-fancy.rev;
    src = inputs.lualine-so-fancy;
  };

  sudoku = buildVimPlugin {
    pname = "sudoku.nvim";
    version = inputs.sudoku.rev;
    src = inputs.sudoku;
  };

  nvim-toggler = buildVimPlugin {
    pname = "nvim-toggler";
    version = inputs.toggler.rev;
    src = inputs.toggler;
  };
}
