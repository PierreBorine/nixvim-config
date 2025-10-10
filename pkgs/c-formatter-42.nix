{ lib
, buildPythonPackage
, writeShellScript
, fetchFromGitHub
, clang-tools
, setuptools
, wheel
}: let
  clang-format-wrapper = writeShellScript "clang-format-linux" ''${lib.getExe' clang-tools "clang-format"} "$@" '';
in buildPythonPackage rec {
  pname = "c-formatter-42";
  version = "0.2.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dawnbeen";
    repo = "c_formatter_42";
    rev = "v${version}";
    hash = "sha256-+9c8Ljz/x2Q6TNzR/mVgVAAIYUGSlXxnEUm2296NwpM=";
  };

  build-system = [
    setuptools
    wheel
  ];

  postPatch = ''
    ln -sf ${clang-format-wrapper} c_formatter_42/data/clang-format-linux
    ln -sf ${clang-format-wrapper} c_formatter_42/data/clang-format-darwin
    ln -sf ${clang-format-wrapper} c_formatter_42/data/clang-format-darwin-arm64
  '';

  pythonImportsCheck = [ "c_formatter_42" ];

  meta = {
    description = "C language formatter for 42 norminette";
    homepage = "https://github.com/dawnbeen/c_formatter_42";
    license = lib.licenses.gpl3Only;
  };
}
