{
  plugins.nvim-tree = {
    enable = true;
    disableNetrw = true;
    hijackCursor = true;
    syncRootWithCwd = true;
    updateFocusedFile = {
      enable = true;
      updateRoot = false;
    };
    view.preserveWindowProportions = true;
    renderer = {
      rootFolderLabel = false;
      highlightGit = true;
      indentMarkers.enable = true;
      icons = {
        glyphs = {
          default = "󰈚";
          folder = {
            default = "";
            empty = "";
            emptyOpen = "";
            open = "";
            symlink = "";
          };
          git.unmerged = "";
        };
      };
    };
  };
}
