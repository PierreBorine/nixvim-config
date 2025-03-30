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

    -- https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1429989436
    vim.api.nvim_create_autocmd('ModeChanged', {
      pattern = '*',
      callback = function()
        if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
            and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require('luasnip').session.jump_active
        then
          require('luasnip').unlink_current()
        end
      end
    })
  '';
  globals = {
    mapleader = " ";
    # disable some default providers
    loaded_node_provider = 0;
    loaded_python3_provider = 0;
    loaded_perl_provider = 0;
    loaded_ruby_provider = 0;
  };
}
