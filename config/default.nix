{
  imports = [
    ./theme
    ./plugins
    ../modules
    ./performance.nix
    ./settings.nix
    ./keymaps.nix

    ({config, ...}: {
      clipboard = {
        register = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xclip.enable = config.settings.portable;
        };
      };
    })
  ];

  opts = {
    laststatus = 3; # Single statusline
    signcolumn = "yes";
    showmode = false;
    wrap = true; # Make sure long lines wrap
    linebreak = true; # Wrap lines at convenient points

    # Indenting
    expandtab = false; # false = real tabs
    smartindent = true;
    shiftwidth = 4;
    tabstop = 4;
    softtabstop = 4;
    list = true; # visible tabs

    # Numbers
    number = true;
    relativenumber = true;
    numberwidth = 2;
    ruler = false;

    undofile = true;
    undolevels = 10000;
    updatetime = 200;

    # Window splits
    splitbelow = true;
    splitright = true;

    fillchars.eob = " ";
    cursorline = true; # Highlight current line
    cursorlineopt = "number"; # Only the number
  };
  # Disable default dashboard
  extraConfigLua = ''
    vim.opt.shortmess:append "sI"
  '';
  globals = {
    mapleader = " ";
    # disable some default providers
    loaded_node_provider = 0;
    loaded_python_provider = 0;
    loaded_python3_provider = 0;
    loaded_perl_provider = 0;
    loaded_ruby_provider = 0;
  };

  files = {
    "ftplugin/nix.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        softtabstop = 2;
      };
    };
  };
}
