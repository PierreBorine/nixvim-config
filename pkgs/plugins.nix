{
  vimUtils,
  inputs,
}: let
  inherit (vimUtils) buildVimPlugin;
in {
  live-server = buildVimPlugin {
    pname = "live-server.nvim";
    version = inputs.live-server.rev;
    src = inputs.live-server;
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
