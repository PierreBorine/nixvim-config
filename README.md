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
  inputs = {
    nixvim-config.url = "github:PierreBorine/nixvim-config";
    # optional, the choice is yours:
    # Decreases your system's closure size at
    # the cost of build time if using the cachix.
    nixvim-config.inputs.nixpkgs.follows = "nixpkgs";
  };
}
```
If you want to reduce build time, you can add my cachix.
```nix
# configuration.nix
{
  nix.settings = {
    substituters = [
      "https://pierreborine.cachix.org"
    ];
    trusted-public-keys = [
      "pierreborine.cachix.org-1:D6WNCFqd5FZkTMem+QF+q25/lU2KFf8C7zBvvzhZZAk="
    ];
  };
}
```
Access the package like this
```Nix
# configuration.nix
{inputs, pkgs, ...}: {
  # With default settings
  environment.systemPackages = [inputs.nixvim-config.packages.${pkgs.system}.default];

  # Recommended:
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
      # Whether to enable 42 School related options
      # Stdheader, norm formatter
      # default: null
      life = 42;
    };
  in [nvim];
}
```

#### Additional configuration
If you want to change some options, you can use [`<nixvim>.extend`](https://nix-community.github.io/nixvim/platforms/standalone.html#extending-an-existing-configuration):
```Nix
{inputs, pkgs, ...}: let
  nvim' = inputs.nixvim-config.packages.${pkgs.system}.default;
  # or
  nvim' = inputs.nixvim-config.lib.mkNvim {
    inherit (pkgs) system;
    inherit inputs;
  };
  nvim = nvim'.extend {
    config = {
      plugins.smear-cursor.enable = true;
      # Some more nixvim configuration...
    };
  };
in {
  environment.systemPackages = [nvim];
}
```

### Bundle
This flake provides a standalone executable that can be run on any distribution.

To get one, first go see the last succesfull [github build action](https://github.com/PierreBorine/nixvim-config/actions) and download the "nixvim" artifact.
<br>If this is not available, clone this repository then run `nix run .#bundle`.

This can take a while to build (and to execute for the first time) so be patient.
```shell
git clone https://github.com/PierreBorine/nixvim-config.git
cd nixvim-config
nix run .#bundle
```

> [!TIP]
> You can also run `nix run .#bundle-deb` to get a .deb file.
