{ vimUtils
, fetchFromGitHub
}:
vimUtils.buildVimPlugin {
  pname = "live-server.nvim";
  version = "2024-07-22";

  src = fetchFromGitHub {
    owner = "barrett-ruth";
    repo = "live-server.nvim";
    rev = "5fc8abb727827a09d0ce1b7757d0a4c7b5802b09";
    sha256 = "sha256-gZDG9PuzRpRJGPkkXiiBZ5w+ZUglMJA08o/ij54ME8o=";
  };
}
