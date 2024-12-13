{extraVimPlugins, pkgs, ...}: {
  extraPlugins = [extraVimPlugins.live-server];

  extraPackages = with pkgs.nodePackages; [
    live-server
  ];

  extraConfigLua = ''
    require('live-server').setup({})
  '';
}
