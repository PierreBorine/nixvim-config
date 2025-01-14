{
  plugins = {
    comment.enable = true;
    comment-box.enable = true;
    todo-comments = {
      enable = true;
      settings.sign_priority = 6; # default overrides git line status
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>/";
      action = "gcc";
      options = {
        desc = "Toggle Comment";
        silent = true;
        remap = true;
      };
    }
    {
      mode = "v";
      key = "<leader>/";
      action = "gc";
      options = {
        desc = "Toggle Comment";
        silent = true;
        remap = true;
      };
    }
  ];
}
