nixvim-config
=============
#### My Nixvim configuration

<div align="center"><img src=".github/assets/screenshot.png" alt="nvim"></div>

## Usage
### Run without installing
```Shell
nix run github:PierreBorine/nixvim-config
```

### Flake
Import this flake into your's
```Nix
# flake.nix
{
  inputs.nixvim-config.url = "github:PierreBorine/nixvim-config";
}
```
Access the package like this
```Nix
# configuration.nix
{inputs, pkgs, ...}: {
  # With default settings
  environment.systemPackages = [inputs.nixvim-config.packages.${pkgs.system}.default];

  # With some settings
  environment.systemPackages = let
    nvim = inputs.nixvim-config.lib.mkNvim {
      inherit (pkgs) system; # mandatory
      # Used to get the flake's options (inputs.self) for the Nix LSP
      # default: null
      inherit inputs;
      # Whether to install and enable wakatime
      # default: false
      wakatime = true;
    };
  in [nvim];
}
```

### Additional configuration
If you want to change some options, you can use [`<nixvim>.extend`](https://nix-community.github.io/nixvim/platforms/standalone.html#extending-an-existing-configuration):
```Nix
{inputs, config, pkgs, ...}: let
  nvim' = inputs.nixvim-config.packages.${pkgs.system}.default;
  nvim = nvim'.extend {
    config = {
      # Some more nixvim configuration...
    };
  };
in {
  environment.systemPackages = [nvim];
}
```
