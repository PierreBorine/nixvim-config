{
  imports = [
    ./theme
    ./plugins
    ../modules
    ./performance.nix
    ./keymaps.nix
  ];

  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };
  opts = {
    laststatus = 3; # Single statusline
    showmode = false;

    # Indenting
    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    softtabstop = 2;

    # Numbers
    number = true;
    numberwidth = 2;
    ruler = false;

    signcolumn = "yes";
    splitbelow = true;
    splitright = true;

    updatetime = 250;
    fillchars = {eob = " ";};
    cursorline = true;
    cursorlineopt = "number";
  };
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
}
