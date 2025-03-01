{ vimUtils
, inputs
}:
vimUtils.buildVimPlugin {
  pname = "nvim-toggler";
  version = inputs.toggler.rev;
  src = inputs.toggler;
}
