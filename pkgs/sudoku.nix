{ vimUtils
, inputs
}:
vimUtils.buildVimPlugin {
  pname = "sudoku.nvim";
  version = inputs.sudoku.rev;
  src = inputs.sudoku;
}
