
{
  config,
  lib,
  ...
}: {
  # TODO:
  config = lib.mkIf (config.lib.isLang "CS") {
    lsp.servers.csharp_ls.enable = true;
  };
}
