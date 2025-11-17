{
  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      nvimRuntime = true;
      plugins = true;
    };

    combinePlugins = {
      enable = true;
      pathsToLink = [
        "/luasnippets"
      ];
      standalonePlugins = [
        "nvim-treesitter"
        "friendly-snippets"
        "blink.cmp"
        "mini.nvim"
      ];
    };
  };
}
