{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.lib.isLang "QML") {
    lsp.servers.qmlls = {
      enable = true;
      config.cmd = ["qmlls" "-E"];
    };
  };
}
