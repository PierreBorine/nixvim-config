{
  plugins.treesitter = {
    enable = true;
    nixGrammars = true;
    settings = {
      ensure_installed = [
        "bash"
        "c"
        "cpp"
        "fish"
        "javascript"
        "html"
        "css"
        "scss"
        "typescript"
        "markdown"
        "json"
        "nix"
        "regex"
        "rust"
        "glsl"
      ];
      highlight = {
        enable = true;
        useLanguagetree = true;
      };

      indent.enable = true;
    };
  };
}
