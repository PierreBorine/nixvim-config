{pkgs, ...}: {
  globals.base46_cache.__raw = ''vim.fn.stdpath "data" .. "/base46/"'';

  extraPlugins = [
    pkgs.vimPlugins.plenary-nvim
    pkgs.vimPlugins.base46
  ];

  extraConfigLua = ''
    require('base46').load_all_highlights()
  '';

  extraFiles = {
    "lua/themes/seti.lua".source = ./seti.lua;
    "lua/lualine/themes/seti-ui.lua".source = ./seti-lualine.lua;
    "lua/chadrc.lua".text =
      # lua
      ''
        local options = {
          base46 = {
            theme = "seti",
            transparency = false,
            integrations = { "bufferline", "vim-illuminate" },
          },
        }
        return options
      '';
  };
}
