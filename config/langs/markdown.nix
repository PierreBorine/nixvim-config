{
  config,
  pkgs,
  lib,
  ...
}: let
  # markdownlint-cli2's config file must have a very specific name
  mdConfigName = ".markdownlint.json";
  mdConfig =
    (pkgs.writeTextDir mdConfigName (
      builtins.toJSON {
        MD033 = false; # No inline html
        MD036 = false; # First line is enphasised but not a header
        MD041 = false; # First line is not a header
      }
    ))
    + "/${mdConfigName}";
in {
  config = lib.mkIf (config.lib.isLang "Markdown") {
    lsp.servers.marksman.enable = true;

    plugins = {
      conform-nvim.settings.formatters_by_ft = {
        markdown = ["markdownlint-cli2"];
      };
      lint = {
        lintersByFt.markdown = ["markdownlint-cli2"];
        linters.markdownlint-cli2 = {
          cmd = lib.getExe pkgs.markdownlint-cli2;
          stdin = true;
          args = ["--config" "${mdConfig}" "-"];
        };
      };

      render-markdown = {
        enable = true;
        lazyLoad.settings = {
          ft = "markdown";
          after =
            # lua
            ''
              function()
                Snacks.toggle({
                  name = "Render Markdown",
                  get = require("render-markdown").get,
                  set = require("render-markdown").set,
                }):map("<leader>um")
              end
            '';
        };
      };
      markdown-preview = {
        enable = true;
        lazyLoad.settings.ft = "markdown";
      };
    };

    extraPackages = [pkgs.markdownlint-cli2];
  };
}
