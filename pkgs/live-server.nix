{ vimUtils
, inputs
}:
vimUtils.buildVimPlugin {
  pname = "live-server.nvim";
  version = inputs.live-server.rev;
  src = inputs.live-server;
}
